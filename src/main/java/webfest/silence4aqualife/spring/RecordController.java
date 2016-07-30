/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package webfest.silence4aqualife.spring;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import webfest.silence4aqualife.Record;
import webfest.silence4aqualife.RecordService;

/**
 *
 * @author vdeiv
 */
@Controller
@RequestMapping(value = "/")
public class RecordController {

    @Autowired
    private RecordService service;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView getRecords() {
        List<Record> ls = service.getRecordsList();
        double lng, lat;
        lng = 46.20738;
        lat = 6.15591;

        System.out.println("yra");
        return new ModelAndView("index", "records", lat).addObject("lng", lng);
    }

    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public ModelAndView getNewForm() {
        ModelAndView model = new ModelAndView("recordForm", "record", new Record());
        return model;
    }
    
    @RequestMapping(value = "info/{id}", method = RequestMethod.GET)
    public ModelAndView recordInfo(@PathVariable long id) {
        return new ModelAndView("recordInfo", "room", service.getRecord(id));
    }
/*
    @RequestMapping(method = RequestMethod.POST)
    public String add(@Valid @ModelAttribute("room") Room room, BindingResult result, Model model) {
        //RoomValidator roomValidator = new RoomValidator();
        //roomValidator.validate(room, result);
        if (result.hasErrors()) {
            System.out.print("ERROR adding");
            model.addAttribute("students", service.getStudentsList());
            return "roomForm";
        }
        service.addRoom(room);
        return "redirect:/rooms.htm";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.POST)
    public String update(@PathVariable long id, @Valid @ModelAttribute("room") Room room, BindingResult result, Model model) {
        // RoomValidator roomValidator = new RoomValidator();
        //roomValidator.validate(room, result);
        if (result.hasErrors()) {
            System.out.print("ERRORAS updating" + result.toString());
            model.addAttribute("students", service.getStudentsList());
            return "roomUpdate";
        }
        service.updateRoom(room);
        return "redirect:/rooms.htm";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ModelAndView getEditForm(@PathVariable long id) {
        return new ModelAndView("roomUpdate", "room", service.getRoom(id)).addObject("students", service.getStudentsList());
    }

    @RequestMapping(value = "/remove/{id}", method = RequestMethod.POST)
    public String remove(@ModelAttribute("room") Room room, BindingResult result) {
        if (result.hasErrors()) {
            System.out.print("ERRORAS deleteing" + result.toString());
            return "roomUpdate";
        }
        service.removeRoom(service.getRoom(room.getId())); //because only id given
        return "redirect:/rooms.htm";
    }
    */
}
