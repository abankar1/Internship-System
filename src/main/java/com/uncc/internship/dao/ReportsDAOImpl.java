package com.uncc.internship.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.uncc.internship.model.CompanyInfoView;
import com.uncc.internship.model.FallPlacementView;

@Component("reportsDAO")
public class ReportsDAOImpl implements ReportsDAO {

	@Autowired
	JdbcTemplate template;

	@Override
	public List<FallPlacementView> placementView() {

		String sql = "select * from fallplacement";
		List<FallPlacementView> placementView = template.query(sql, new BeanPropertyRowMapper(FallPlacementView.class));
		return placementView;

	}

	@Override
	public List<CompanyInfoView> companiesView() {
		String sql = "select * from companyinfo";
		List<CompanyInfoView> companiesView = template.query(sql, new BeanPropertyRowMapper(CompanyInfoView.class));
		return companiesView;
	}
}
