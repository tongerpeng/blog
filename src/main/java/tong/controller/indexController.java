package tong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by mi on 17-4-12.
 */

@Controller
public class indexController {

    @RequestMapping("/")
    public String index() {
        System.out.println("hello");
        return "index";
    }
}
