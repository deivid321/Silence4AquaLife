/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package webfest.silence4aqualife.spring;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import org.hibernate.validator.internal.util.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
    
    @Autowired
    private ServletContext servletContext;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView getRecords() {
        List<Record> ls = service.getRecordsList();
        String result = "[";
        for (int i = 0; i < ls.size(); i++) {
            result += "\"" + ls.get(i).getId() + "\"";
            result += ", ";
            result += "\"" + ls.get(i).getLng() + "\"";
            result += ", ";
            result += "\"" + ls.get(i).getLat() + "\"";
            if (i < ls.size() - 1) {
                result += ", ";
            }
        }
        result += "]";
        return new ModelAndView("index", "records", result);
    }

    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public ModelAndView getNewForm() {
        ModelAndView model = new ModelAndView("recordForm", "record", new Record());
        return model;
    }

    @RequestMapping(value = "info/{id}", method = RequestMethod.GET)
    public ModelAndView recordInfo(@PathVariable long id) {
        return new ModelAndView("recordInfo", "record", service.getRecord(id));
    }

    /**
     * Upload multiple file using Spring Controller
     */
    @RequestMapping(value = "/new", method = RequestMethod.POST)
    public @ResponseBody String uploadMultipleFileHandler(@ModelAttribute("record") Record record, BindingResult result, Model model, @RequestParam("file") MultipartFile[] files) {
        service.addRecord(record);
        String message = "";
        for (int i = 0; i < 2; i++) {
            MultipartFile file = files[i];
            String name = record.getId() +"_"+ record.getName() +"_"+ record.getSurname() + i;
            try {
                byte[] bytes = file.getBytes();
                String str = new String(bytes, "UTF-8"); // for UTF-8 encoding
                // Creating the directory to store file
                String rootPath = null;
                //rootPath = System.getProperty("catalina.home");
                //rootPath = servletContext.getContextPath();
                rootPath = System.getProperty("user.dir");
                System.out.println(rootPath);
                File dirs = new File(servletContext.getContextPath());
                System.out.println(dirs.getAbsolutePath().toString());
                File dir = new File(rootPath + File.separator + "tmpFiles");
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                // Create the file on server
                File serverFile = null;
                if (i == 0) {
                    serverFile = new File(dir.getAbsolutePath() + File.separator + name + ".mp3");
                    record.setAudioName(name);
                } else {
                    serverFile = new File(dir.getAbsolutePath() + File.separator + name + ".csv");
                    record.setCsvName(name);
                }
                // Path file = Files.createTempFile(Paths.get("/var/webapp/images"), "somefilename-", ".jpg", );

                BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();

                message = message + "You successfully uploaded file=" + name + "";
            } catch (Exception e) {
                return "You failed to upload " + name + " => " + e.getMessage();
            }
        }
        return message;
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
