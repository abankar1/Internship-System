package com.uncc.internship;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.uncc.internship.model.CompanyInfoView;
import com.uncc.internship.model.FallPlacementView;
import com.uncc.internship.service.ReportsService;

@Controller
@SessionAttributes("user")
public class ReportsController {

	@Autowired
	public ReportsService reportsService;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/reports", method = RequestMethod.GET)
	public ModelAndView home() {
		logger.info("reports");
		ModelAndView model = new ModelAndView("reports");
		return model;
	}

	@RequestMapping(value = "/fallReports.html", method = RequestMethod.POST)
	public ModelAndView placementView(@RequestParam Map<String, String> req) {
		logger.info("fallPlacement");

		List<FallPlacementView> placementView = reportsService.placementView();
		ModelAndView model = new ModelAndView("fallPlacement", "placementview", placementView);

		logger.info(model.getViewName());
		return model;

	}

	@RequestMapping(value = "/companyReports.html", method = RequestMethod.POST)
	public ModelAndView companiesView(@RequestParam Map<String, String> req) {
		logger.info("partnerCompanies");
		List<CompanyInfoView> companiesView = reportsService.companiesView();
		ModelAndView model = new ModelAndView("partnerCompanies", "companiesView", companiesView);

		logger.info(model.getViewName());
		return model;
	}
}
