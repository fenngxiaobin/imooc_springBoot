package com.sxdubbo.learn;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ProviderLearnApplicationTests {

//    @Autowired
//    UserService userService;
//    @Autowired
//    public CourseService courseService;

    @Test
    public void contextLoads() {
    }

//    @Test
//    public void testSaveUser() {
//        User user = new User();
//        user.setUsername("asasdasd123");
//        user.setPassword("asbaf123");
//        user.setEmail("asd");
//        userService.addUser(user);
//    }
//
//    @Test
//    public void showUser() {
//        User user = new User();
////		user.setUsername("asasdasd123");
////		user.setPassword("asbaf123");
////		user.setEmail("asd");
//        user = userService.findByUsername("luwei");
//        System.out.println(user.getUsername());
//
//    }

//    @Test
//    public void getUserByUsername(){
//        User user = new User();
//
//        user = userService.findByUsername("luwei");
//        System.out.println("here is user info"+user.getPassword());
//    }
//
//    @Test
//    public void findByTypeLike(){
//        String type = "UI设计";
//        List<Course> courseList = courseService.findByTypeLike(type);
//        for(Course c:courseList){
//            System.out.println(c.getType()+"getType++++++++++");
//        }
//    }

}
