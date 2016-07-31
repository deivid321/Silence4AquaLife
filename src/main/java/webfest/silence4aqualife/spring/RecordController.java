/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package webfest.silence4aqualife.spring;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.hibernate.validator.internal.util.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.request;
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

    @RequestMapping(value = "/motivation", method = RequestMethod.GET)
    public String getMotivation() {
        //ModelAndView model = new ModelAndView("recordForm", "record", new Record());
        //return model;
        return "motivation";
    }

    @RequestMapping(value = "/process", method = RequestMethod.GET)
    public String getProcess() {
        //ModelAndView model = new ModelAndView("recordForm", "record", new Record());
        //return model;
        return "process";
    }
    @RequestMapping(value = "/help", method = RequestMethod.GET)
    public String getHelp() {
        //ModelAndView model = new ModelAndView("recordForm", "record", new Record());
        //return model;
        return "help";
    }

    @RequestMapping(value = "info/{id}", method = RequestMethod.GET)
    public ModelAndView recordInfo(@PathVariable long id) {
        return new ModelAndView("recordInfo", "record", service.getRecord(id)).addObject("root", servletContext.getRealPath("/") + "data\\");
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
            //file.get
            String name = record.getId() + "_" + record.getName() + "_" + record.getSurname() + i;
            if (i == 0) {
                    name = name + ".mp3";
                    record.setAudioName(name);
                } else {
                    name = name + ".csv";
                    record.setCsvName(name);
                }
            
            try {
                byte[] bytes = file.getBytes();
                String str = new String(bytes, "UTF-8"); // for UTF-8 encoding

                //String filePath = servletContext.getRealPath("/") + "data\\" + name;
                String filePath = "C:\\Users\\vdeiv\\Documents\\NetBeansProjects\\Silence4AquaLife-spring\\src\\main\\webapp\\data\\"+name;
                File dest = new File(filePath);
                try {
                    file.transferTo(dest);
                } catch (IllegalStateException e) {
                    e.printStackTrace();
                    return "File uploaded failed:" + name;
                } catch (IOException e) {
                    e.printStackTrace();
                    return "File uploaded failed:" + name;
                }
               // return "File uploaded:" + orgName;
                /*
                String rootPath = null;
                rootPath = System.getProperty("catalina.home");
                System.out.println(rootPath);
                //File dirs = new File(servletContext.getContextPath());
                //System.out.println(request.getServletContext());
                File dir = new File(rootPath + File.separator + "tmpFiles");
                //File dir = new File(rootPath);
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
                */
                message = message + "You successfully uploaded file=" + name + "";
               // return "redirect:/rooms.htm";
            } catch (Exception e) {
                return "You failed to upload " + name + " => " + e.getMessage();
            }
        }
        //return "redirect:/info/"+record.getId()+".htm";
        return message + "<a href="+"http://localhost:8080/Silence4AquaLife-spring/info/"+record.getId()+".htm" + ">Get Info</a>";
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
