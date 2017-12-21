package com.jcohy;

import com.jcohy.model.User;
import com.jcohy.repository.UserRepository;
import com.jcohy.utils.MD5Kit;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.core.env.Environment;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class JcohyApplicationTests {
	private final static Logger logger = LoggerFactory.getLogger(JcohyApplicationTests.class);
	@Autowired
	private UserRepository userRepository;
	@Test
	public void contextLoads(Environment env) {
//		List<User> all = userRepository.findAll();
		String passwordMD5 = MD5Kit.generatePasswordMD5("111111", "jcohy");
		System.out.println(passwordMD5);
	}
}
