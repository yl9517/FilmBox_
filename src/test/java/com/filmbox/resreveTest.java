package com.filmbox;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.film.dto.KakaopayDTO;
import com.film.dto.ScreenDTO;
import com.film.mapper.ReserveMapper;
import com.film.service.ReserveService;
import com.zaxxer.hikari.HikariDataSource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml")
public class resreveTest {

	@Autowired
	private HikariDataSource ds;

	@Resource(name = "reserveservice")
	private ReserveService reservice;
	@Autowired
	private ReserveMapper mapper;
	@Test
	public void t1() {
		KakaopayDTO dto = new KakaopayDTO();
		dto.setReserveDate("2021.9.30(목)");
		dto.setScreenTime("18:00");
		dto.setMovieCd("20217742");

		List<String> slist = reservice.getseats(dto);
		for(String data: slist) {
			System.out.println(data);
		}
		
	}
	
	
}
