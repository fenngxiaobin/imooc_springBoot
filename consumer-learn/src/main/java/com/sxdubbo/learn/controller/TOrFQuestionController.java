package com.sxdubbo.learn.controller;

import com.sxdubbo.learn.utils.ExcelImportUtils;
import com.sxdubboapi.learn.domain.ChoiceQuestion;
import com.sxdubboapi.learn.domain.TOrFQuestion;
import com.sxdubboapi.learn.domain.Course;
import com.sxdubboapi.learn.domain.User;
import com.sxdubboapi.learn.service.TOrFQuestionService;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.*;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * created by  luwei
 * 2018-03-06 11:38.
 **/
@Controller
@RequestMapping("/tOrF")
public class TOrFQuestionController {
    @Autowired
    public TOrFQuestionService tOrFQuestionService;
    @Autowired
    public CourseService courseService;
    @Autowired
    public UserService userService;
//    @Value("${web.upload-path}")
//    private String filePath;


    @RequestMapping("/listTOrF")
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
            List<TOrFQuestion> tOrFQuestionList = tOrFQuestionService.findByCourse(course);
            List<Course> courseList = new ArrayList<Course>();
            if(user != null){
                if(user.getUserType() == 0){
                    courseList = courseService.findAllCourse();
                }else{
                    courseList = courseService.findByUserId(user.getId());
                }
            }
            model.addAttribute("questionList", tOrFQuestionList);
            model.addAttribute("courseList",courseList);
            model.addAttribute("courseId",courseId);
            model.addAttribute("course",course);
        } else {
            List<Course> courseList = new ArrayList<Course>();
            List<TOrFQuestion> tOrFQuestionList = new ArrayList<TOrFQuestion>();
            if(user != null){
                if(user.getUserType() == 0){
                    courseList = courseService.findAllCourse();
                    tOrFQuestionList = tOrFQuestionService.findAllQuestion();
                }else{
                    courseList = courseService.findByUserId(user.getId());
                    System.out.println();
                    tOrFQuestionList = tOrFQuestionService.findByUser(user);
                }
            }
//            List<TOrFQuestion> tOrFQuestionList = tOrFQuestionService.findAllQuestion();
            model.addAttribute("questionList",tOrFQuestionList);
            model.addAttribute("courseList",courseList);
            model.addAttribute("courseId",null);
        }

        return "/admin/test/tOrF_list";
    }
    @PostMapping("/addTOrF")
    public String addTOrF(@Valid TOrFQuestion tOrFQuestion, @RequestParam(value = "courseId",required = false) Integer courseId, RedirectAttributes attributes){
        System.out.println(tOrFQuestion.getCourse().getId()+"&&&&&&&&&&&&&)))))))");

        User user = userService.getUserById(tOrFQuestion.getUser().getId());
        Course course = courseService.findById(tOrFQuestion.getCourse().getId());
        tOrFQuestion.setUser(user);
        tOrFQuestion.setCourse(course);
        tOrFQuestion.setCreateDate(new Date());
        tOrFQuestion.setModifyDate(new Date());
        tOrFQuestionService.addTOrFQuestion(tOrFQuestion);
        attributes.addAttribute("courseId",courseId);
        return "redirect:/tOrF/listTOrF";
    }
    @GetMapping("/deleteTOrF")
    public String deleteTOrF(@RequestParam("id") Integer id,@RequestParam(value = "courseId",required = false) Integer courseId, RedirectAttributes attributes){

        tOrFQuestionService.deleteTOrFQuestion(id);
        attributes.addAttribute("courseId",courseId);
        return "redirect:/tOrF/listTOrF";
    }


    @RequestMapping("/importTOrF")
    public String importChoice(HttpServletRequest request, HttpServletResponse response,
                               @RequestParam(value="tOrFQuestion") MultipartFile file, RedirectAttributes attributes){
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //使用request对象的getSession()获取session，如果session不存在则创建一个
        HttpSession session = request.getSession();
        System.out.println("in importTOrF");
        //判断文件是否为空
        if(file==null){
            session.setAttribute("msg","文件不能为空！");
            session.setAttribute("errMessage",null);
            return "redirect:/tOrF/listTOrF";
        }
        //获取文件名
        String fileName=file.getOriginalFilename();

        //验证文件名是否合格
        if(!ExcelImportUtils.validateExcel(fileName)){
            session.setAttribute("msg","文件必须是excel格式！");
            session.setAttribute("errMessage",null);
            return "redirect:/tOrF/listTOrF";
        }

        //进一步判断文件内容是否为空（即判断其大小是否为0或其名称是否为null）
        long size=file.getSize();
        if(StringUtils.isEmpty(fileName) || size==0){
            session.setAttribute("msg","文件不能为空！");
            session.setAttribute("errMessage",null);
            return "redirect:/tOrF/listTOrF";
        }
        session.setAttribute("msg",null);

        User user = (User) session.getAttribute("userInfo");

        if(user != null && !file.isEmpty()){
//            String filePath1 = ClassUtils.getDefaultClassLoader().getResource("static/admin/").getPath();
            String filePath1 = request.getRealPath("/")+"data/upload/uploadExcel/";
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
            InputStream is = null;
            try{
                //将上传的文件写入新建的文件中
                file.transferTo(tempFile);

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
                return "redirect:/tOrF/listTOrF";
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
        List<TOrFQuestion> tOrFQuestionList=new ArrayList<TOrFQuestion>();
        TOrFQuestion tempTorFQuestion;

        String br = "<br/>";

        //循环Excel行数,从第二行开始。标题不入库
        for(int r=1;r<totalRows;r++){
            String rowMessage = "";
            Row row = sheet.getRow(r);
            if (row == null){
                errorMsg += br+"第"+(r+1)+"行数据有问题，请仔细检查！";
                continue;
            }
            tempTorFQuestion = new TOrFQuestion();

            String courseId = "";
            String content = "";
            String answer = "";

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
                            tempTorFQuestion.setCourse(courseService.findById(Integer.parseInt(courseId)));
                            break;
                        case 1:
                            content = cell.getStringCellValue();
                            if(StringUtils.isEmpty(content)){
                                rowMessage += "问题不能为空；";
                            }else if(content.length()>500){
                                rowMessage += "问题的字数不能超过500；";
                            }
                            tempTorFQuestion.setContent(content);
                            break;
                        case 2:
                            answer = cell.getStringCellValue();
                            if(StringUtils.isEmpty(answer)){
                                rowMessage += "答案不能为空；";
                            }else if(answer.length()>10){
                                rowMessage += "答案的字数不能超过10；";
                            }
                            tempTorFQuestion.setAnswer(answer);
                            break;
                        case 5:
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
                tempTorFQuestion.setCreateDate(new Date());
                tempTorFQuestion.setModifyDate(new Date());
                System.out.println("");
                tempTorFQuestion.setUser(userService.getUserById(userId));
                tOrFQuestionList.add(tempTorFQuestion);
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
            for(int i =0;i<tOrFQuestionList.size();i++){
                tOrFQuestionService.addTOrFQuestion(tOrFQuestionList.get(i));
            }
            errorMsg = "导入成功，共"+tOrFQuestionList.size()+"条数据！";
        }
        return errorMsg;
    }
}
