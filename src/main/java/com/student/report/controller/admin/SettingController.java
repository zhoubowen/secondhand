package com.student.report.controller.admin;

import com.student.report.constant.SettingEnum;
import com.student.report.entity.Setting;
import com.student.report.service.SettingService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 */
@Controller
@RequestMapping("/admin/setting/")
public class SettingController {

    @Autowired
    private SettingService settingService;

    @RequestMapping("index")
    public ModelAndView index(){
        Setting setting = settingService.findByKey(SettingEnum.ASK_THRESHOLD.getKey());
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/admin/setting");
        modelAndView.addObject("setting", setting);
        return modelAndView;
    }

    @RequestMapping("update")
    public String update(Setting setting){
        settingService.updateByPrimaryKeySelective(setting);
        return "redirect:/admin/setting/index";
    }
}
