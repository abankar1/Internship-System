package com.uncc.internship;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.uncc.internship.form.ApplicationForm;
import com.uncc.internship.form.ApplyForm;
import com.uncc.internship.form.InternshipDetailsReportForm;
import com.uncc.internship.form.LoginForm;
import com.uncc.internship.form.PaperworkForm;
import com.uncc.internship.form.PersonSession;
import com.uncc.internship.model.Application;
import com.uncc.internship.model.IntershipDetailsView;
import com.uncc.internship.service.ApplicationService;
import com.uncc.internship.service.InternshipService;

@Controller
@SessionAttributes("user")
public class ApplicationController {

	@Autowired
	public ApplicationService applicationService;

	private static final Logger logger = LoggerFactory.getLogger(ApplicationController.class);

	@RequestMapping(value = "/apply.html", method = RequestMethod.GET)
	public String show(Map model) {
		logger.info("apply");
		ModelAndView modelSuccess = new ModelAndView("internshipdetails");
		ApplyForm applyForm = new ApplyForm();

		model.put("applyForm", applyForm);
		modelSuccess.addAllObjects(model);

		return "internshipdetails";
	}

	@RequestMapping(value = "/apply.html/{applicationID}", method = RequestMethod.POST)
	public ModelAndView processForm(@ModelAttribute("applyForm") ApplyForm applyForm,
			@ModelAttribute("user") PersonSession user, @PathVariable("applicationID") String applicationID, Map model,
			BindingResult result) {
		logger.info("apply" + user.getUsername() + ":" + applicationID);
		ModelAndView modelSuccess = new ModelAndView("appliedConfirmation");
		boolean applied = applicationService.applyForInternship(user.getUsername(), applicationID);
		if (applied) {

			model.put("applyForm", applyForm);
			model.put("msg", "Applied");
			
			modelSuccess.addAllObjects(model);
			return modelSuccess;

		} else {
			result.rejectValue("msg", "Can't apply");
			model.put("msg", "Can't apply");
			modelSuccess.addAllObjects(model);
			return modelSuccess;
		}

	}

	@RequestMapping(value = "/editApplication.html", method = RequestMethod.GET)
	public ModelAndView editApplicationShow(Map model) {
		logger.info("editApplicationShow");
		
		ApplicationForm appForm = new ApplicationForm();
		List<Application> pending = applicationService.pending();
		model.put("appForm", appForm);
		model.put("pending", pending);
		ModelAndView modelSuccess = new ModelAndView("editApplication","pending",pending);
		modelSuccess.addAllObjects(model);

		return modelSuccess;
	}

	@RequestMapping(value = "/updateApplication.html/{applicationID}", method = RequestMethod.POST)
	public ModelAndView editApplication(@ModelAttribute("appForm") ApplicationForm appForm,
			@PathVariable("applicationID") String applicationID, Map model, BindingResult result) {

		boolean applied = applicationService.editApplication(appForm.getStatus(), applicationID);
		if (applied) {
			ModelAndView modelSuccess = new ModelAndView("paperwork");
			model.put("appForm", appForm);
			model.put("applicationID", applicationID);
			modelSuccess.addAllObjects(model);
			return modelSuccess;

		} else {
			result.reject("msg","Not Updated");
			return editApplicationShow(model);
		}

	}

	@RequestMapping(value = "/paperwork.html", method = RequestMethod.GET)
	public ModelAndView paperworkApplication(Map model) {
		logger.info("paperwork");
		ModelAndView models = new ModelAndView("paperwork");
		PaperworkForm paperworkForm = new PaperworkForm();
		model.put("paperworkForm", paperworkForm);
		models.addAllObjects(model);
		return models;

	}

	@RequestMapping(value = "/paperwork.html", method = RequestMethod.POST)
	public ModelAndView paperworkApplication(@ModelAttribute("paperworkForm") PaperworkForm paperworkForm, Map model,
			BindingResult result) {

		boolean applied = applicationService.paperworkApplication(paperworkForm);
		if (applied) {
			ModelAndView modelSuccess = new ModelAndView("editApplication");

			return modelSuccess;

		} else {
			ModelAndView modelFail = new ModelAndView("paperwork");
			result.rejectValue("error", "please try again");
			modelFail.addObject(result);
			return modelFail;
		}

	}
}
