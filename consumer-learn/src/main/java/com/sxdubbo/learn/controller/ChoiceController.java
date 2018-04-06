package com.sxdubbo.learn.controller;

import com.sxdubbo.learn.utils.ExcelImportUtils;
import com.sxdubbo.learn.utils.FileUtils;
import com.sxdubboapi.learn.domain.ChoiceQuestion;
import com.sxdubboapi.learn.domain.Course;
import com.sxdubboapi.learn.domain.User;
import com.sxdubboapi.learn.service.ChoiceQuestionService;
import com.sxdubboapi.learn.service.CourseService;
import com.sxdubboapi.learn.service.UserService;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ClassUtils;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sound.midi.Soundbank;
import javax.validation.Valid;
import java.io.*;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * created by  luwei
 * 2018-03-05 15:16.
 **/
@Controller
@RequestMapping("/choice")
public class ChoiceController {
    @Autowired
    public ChoiceQuestionService choiceQuestionService;
    @Autowired
    public CourseService courseService;
    @Autowired
    public UserService userService;

//    @Value("${web.upload-path}")
//    private String filePath;


    @RequestMapping("/listChoice")
    public String listQuestion(@RequestParam(value = "courseId",required = false) Integer courseId,
                               Model model, HttpServletRequest request, HttpServletResponse response){
        //flag 1: choice question 2：true or false question
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //使用request对象的getSession()获取session，如果session不存在则创建一个
        HttpSession session = request.getSession();
        //将数据存储到session中
        User user = (User)session.getAttribute("userInfo");
        if (courseId != null) {
            Course course = courseService.findById(courseId);
            List<ChoiceQuestion> choiceQuestionList = choiceQuestionService.findByCourse(course);
            List<Course> courseList = new ArrayList<Course>();
            if(user != null){
                if(user.getUserType() == 0){
                    courseList = courseService.findAllCourse();
                }else{
                    courseList = courseService.findByUserId(user.getId());
                }
            }
//            System.out.println(choiceQuestionList);
            model.addAttribute("questionList", choiceQuestionList);
            model.addAttribute("courseList",courseList);
            model.addAttribute("courseId",courseId);
            model.addAttribute("course",course);
        } else {
            List<Course> courseList = new ArrayList<Course>();
            List<ChoiceQuestion> choiceQuestionList = new ArrayList<ChoiceQuestion>();
            if(user != null){
                if(user.getUserType() == 0){
                    courseList = courseService.findAllCourse();
                    choiceQuestionList = choiceQuestionService.findAllQuestion();
                }else{
                    courseList = courseService.findByUserId(user.getId());
                    choiceQuestionList = choiceQuestionService.findByUser(user);
                }
            }
//            List<ChoiceQuestion> choiceQuestionList = choiceQuestionService.findAllQuestion();
            model.addAttribute("questionList",choiceQuestionList);
            model.addAttribute("courseList",courseList);
            model.addAttribute("courseId",null);
//            model.addAttribute("course",course);
        }
        return "/admin/test/choice_list";
    }
    @PostMapping("/addChoice")
    public String addChoice(@Valid ChoiceQuestion choiceQuestion,@RequestParam(value = "courseId",required = false) Integer courseId, RedirectAttributes attributes){
        System.out.println(choiceQuestion.getCourse().getId()+"&&&&&&&&&&&&&)))))))");

        User user = userService.getUserById(choiceQuestion.getUser().getId());
        Course course = courseService.findById(choiceQuestion.getCourse().getId());
        choiceQuestion.setUser(user);
        choiceQuestion.setCourse(course);
        choiceQuestion.setCreateDate(new Date());
        choiceQuestion.setModifyDate(new Date());
        choiceQuestionService.addChoiceQuestion(choiceQuestion);
        attributes.addAttribute("courseId",courseId);
        return "redirect:/choice/listChoice";
    }
    @GetMapping("/deleteChoice")
    public String deleteChoice(@RequestParam("id") Integer id,@RequestParam(value = "courseId",required = false) Integer courseId, RedirectAttributes attributes){

        choiceQuestionService.deleteChoiceQuestion(id);
        attributes.addAttribute("courseId",courseId);
        return "redirect:/choice/listChoice";
    }

    @RequestMapping("/importChoice")
    public String importChoice(HttpServletRequest request, HttpServletResponse response,
                               @RequestParam(value="choiceQuestion") MultipartFile file, RedirectAttributes attributes){
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //使用request对象的getSession()获取session，如果session不存在则创建一个
        HttpSession session = request.getSession();
        //判断文件是否为空
        if(file==null){
            session.setAttribute("msg","文件不能为空！");
            session.setAttribute("errMessage",null);
            return "redirect:/choice/listChoice";
        }
        //获取文件名
        String fileName=file.getOriginalFilename();

        //验证文件名是否合格
        if(!ExcelImportUtils.validateExcel(fileName)){
            session.setAttribute("msg","文件必须是excel格式！");
            session.setAttribute("errMessage",null);
            return "redirect:/choice/listChoice";
        }

        //进一步判断文件内容是否为空（即判断其大小是否为0或其名称是否为null）
        long size=file.getSize();
        if(StringUtils.isEmpty(fileName) || size==0){
            session.setAttribute("msg","文件不能为空！");
            session.setAttribute("errMessage",null);
            return "redirect:/choice/listChoice";
        }
        session.setAttribute("msg",null);

        User user = (User) session.getAttribute("userInfo");

        if(user != null && !file.isEmpty()){
//            String filePath1 = ClassUtils.getDefaultClassLoader().getResource("static/admin/").getPath();

            String filePath1 = request.getRealPath("/")+"data/upload/uploadExcel/";
//            String suffixName = fileName.substring(fileName.lastIndexOf("."));
            System.out.println(filePath1);
            try {
                filePath1 = URLDecoder.decode(filePath1, "utf-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            File dest = new File(filePath1);
            // 检测是否存在目录
            if (!dest.exists()) {
                dest.mkdirs();// 新建文件夹
            }
//            String filePath  = filePath1+"uploadExcel/";
//            File dest = new File(filePath);
            File tempFile = new File(filePath1 + new Date().getTime() + ".xlsx");
//            String file_name = System.currentTimeMillis() + suffixName;
            InputStream is = null;
            try{
                //将上传的文件写入新建的文件中
                file.transferTo(tempFile);
//                FileUtils.uploadFile(file.getBytes(), filePath1, file_name);

                //根据新建的文件实例化输入流
                is = new FileInputStream(tempFile);

                //根据版本选择创建Workbook的方式
                Workbook wb = null;
                //根据文件名判断文件是2003版本还是2007版本
                if(ExcelImportUtils.isExcel2007(fileName)){
                    wb = new XSSFWorkbook(is);
                }else{
                    wb = new HSSFWorkbook(is);
                }
                //根据excel里面的内容读取知识库信息
                String mes =  readExcelValue(wb,user.getId(),tempFile);
                session.setAttribute("errMessage",mes);
                return "redirect:/choice/listChoice";
            }catch(Exception e){
                e.printStackTrace();
            } finally{
                if(is !=null)
                {
                    try{
                        is.close();
                    }catch(IOException e){
                        is = null;
                        e.printStackTrace();
                    }
                }
            }
            return "导入出错！请检查数据格式！";
        }
        return null;
    }

    /**
     * 解析Excel里面的数据
     * @param wb
     * @return
     */
    private String readExcelValue(Workbook wb,Integer userId,File tempFile){

        //错误信息接收器
        String errorMsg = "";
        //得到第一个shell
        Sheet sheet=wb.getSheetAt(0);
        //得到Excel的行数
        int totalRows=sheet.getPhysicalNumberOfRows();
        //总列数
        int totalCells = 0;
        //得到Excel的列数(前提是有行数)，从第二行算起
        if(totalRows>=2 && sheet.getRow(1) != null){
            totalCells=sheet.getRow(1).getPhysicalNumberOfCells();
        }
        List<ChoiceQuestion> choiceQuestionList=new ArrayList<ChoiceQuestion>();
        ChoiceQuestion tempChoiceQuestion;

        String br = "<br/>";

        //循环Excel行数,从第二行开始。标题不入库
        for(int r=1;r<totalRows;r++){
            String rowMessage = "";
            Row row = sheet.getRow(r);
            if (row == null){
                errorMsg += br+"第"+(r+1)+"行数据有问题，请仔细检查！";
                continue;
            }
            tempChoiceQuestion = new ChoiceQuestion();

            String courseId = "";
            String content = "";
            String answer = "";
            String op1="";
            String op2="";
            String op3="";
            String op4="";

            //循环Excel的列
            for(int c = 0; c <totalCells; c++){
                Cell cell = row.getCell(c);
                if (null != cell){
                    switch (c){
                        case 0:
                            row.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
                            courseId = cell.getStringCellValue();
                            if(StringUtils.isEmpty(courseId)){
                                rowMessage += "课程编号不能为空；";
                            }
                            tempChoiceQuestion.setCourse(courseService.findById(Integer.parseInt(courseId)));
                            break;
                        case 1:
                            content = cell.getStringCellValue();
                            if(StringUtils.isEmpty(content)){
                                rowMessage += "问题不能为空；";
                            }else if(content.length()>500){
                                rowMessage += "问题的字数不能超过500；";
                            }
                            tempChoiceQuestion.setContent(content);
                            break;
                        case 2:
                            answer = cell.getStringCellValue();
                            if(StringUtils.isEmpty(answer)){
                                rowMessage += "答案不能为空；";
                            }else if(answer.length()>10){
                                rowMessage += "答案的字数不能超过10；";
                            }
                            tempChoiceQuestion.setAnswer(answer);
                            break;
                        case 3:
                            op1 = cell.getStringCellValue();
                            if(StringUtils.isEmpty(op1)){
                                rowMessage += "答案不能为空；";
                            }else if(op1.length()>500){
                                rowMessage += "答案的字数不能超过500；";
                            }
                            tempChoiceQuestion.setOp1(op1);
                            break;
                        case 4:
                            op2 = cell.getStringCellValue();
                            if(StringUtils.isEmpty(op2)){
                                rowMessage += "答案不能为空；";
                            }else if(op2.length()>500){
                                rowMessage += "答案的字数不能超过500；";
                            }
                            tempChoiceQuestion.setOp2(op2);
                            break;
                        case 5:
                            op3 = cell.getStringCellValue();
                            if(StringUtils.isEmpty(op3)){
                                rowMessage += "答案不能为空；";
                            }else if(op3.length()>500){
                                rowMessage += "答案的字数不能超过500；";
                            }
                            tempChoiceQuestion.setOp3(op3);
                            break;
                        case 6:
                            op4 = cell.getStringCellValue();
                            if(StringUtils.isEmpty(op4)){
                                rowMessage += "答案不能为空；";
                            }else if(op4.length()>500){
                                rowMessage += "答案的字数不能超过500；";
                            }
                            tempChoiceQuestion.setOp4(op4);
                            break;
                        default:

                            break;
                    }
                }else{
                    rowMessage += "第"+(c+1)+"列数据有问题，请仔细检查；";
                }
            }
            //拼接每行的错误提示
            if(!StringUtils.isEmpty(rowMessage)){
                errorMsg += br+"第"+(r+1)+"行，"+rowMessage;
            }else{
                tempChoiceQuestion.setCreateDate(new Date());
                tempChoiceQuestion.setModifyDate(new Date());
                tempChoiceQuestion.setUser(userService.getUserById(userId));
                choiceQuestionList.add(tempChoiceQuestion);
            }
        }

        //删除上传的临时文件
        if(tempFile.exists()){
            tempFile.delete();
        }

        //全部验证通过才导入到数据库
        if(StringUtils.isEmpty(errorMsg)){
//            for(ChoiceQuestion choiceQuestion: choiceQuestionList){
//                this.addChoice(choiceQuestion);
//            }
            for(int i =0;i<choiceQuestionList.size();i++){
                choiceQuestionService.addChoiceQuestion(choiceQuestionList.get(i));
            }
            errorMsg = "导入成功，共"+choiceQuestionList.size()+"条数据！";
        }
        return errorMsg;
    }
}
