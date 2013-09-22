package db.lab5.common.controllers;

import db.lab5.common.model.PgApi;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
    PgApi pgApi;

    public  MainController() {
        pgApi = new PgApi();
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView index() {
        ModelAndView model = new ModelAndView("index");
        model.addObject("title", "CS 4.1, DB Lab #5, Kharkov Aviation Institute");

        return model;
    }

    @RequestMapping(value = "/selectTest", method = RequestMethod.GET)
    public ModelAndView runSelectTest() {
        ModelAndView model = new ModelAndView("index");
        pgApi.runSelect();

        return model;
    }
    @RequestMapping(value = "/updateTest", method = RequestMethod.GET)
    public ModelAndView runUpdateTest() {
        ModelAndView model = new ModelAndView("index");
        pgApi.runUpdate();

        return model;
    }

    @RequestMapping(value = "/procedure", method = RequestMethod.GET)
    public ModelAndView runProcedure() {
        ModelAndView model = new ModelAndView("index");
        pgApi.runProcedure();

        return model;
    }
}
