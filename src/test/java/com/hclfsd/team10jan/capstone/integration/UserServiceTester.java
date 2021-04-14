package com.hclfsd.team10jan.capstone.integration;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.doAnswer;
import static org.mockito.Mockito.doNothing;
import static org.mockito.Mockito.when;

import java.util.ArrayList;

import org.assertj.core.util.Arrays;
import org.junit.Before;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.Spy;
import org.mockito.internal.stubbing.answers.DoesNothing;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

import com.hclfsd.team10jan.capstone.CapstoneApplication;
import com.hclfsd.team10jan.capstone.entities.User;
import com.hclfsd.team10jan.capstone.repositories.UserRepository;
import com.hclfsd.team10jan.capstone.services.UserService;

@RunWith(SpringRunner.class)
@SpringBootTest
public class UserServiceTester extends CapstoneApplication{

	@MockBean
	private UserRepository userRepo;
	
	@Mock
	private User user;
	
	@Autowired
	private UserService userService;
	
	@Before
	void setUp() {
		Mockito.mockConstruction(User.class);

	}
	
	@Test
	void getAllUsersTest() {
		user = new User("Test", "test@test.com", "password", (long) 1234567890, "ROLE_USER");
		ArrayList<User> testarr = new ArrayList<User>();
		testarr.add(user);
		
		
		when(userRepo.findAll()).thenReturn(testarr);
		Iterable<User> users = userService.getAllUsers();
		for (User i: users) {
			assert("Test".equals(i.getUsername()));
		}
	}
	
	@Test
	void deleteUserTest() {
		user = new User("Test", "test@test.com", "password", (long) 1234567890, "ROLE_USER");
		ArrayList<User> testarr = new ArrayList<User>();
		user.setId(0);
		testarr.add(user);
		
		doAnswer(invocation -> {
			Object arg0 = invocation.getArgument(0);
			for (User i: testarr) {
				assert(i.getId() == arg0);
			}

			return null;
		}).when(userRepo).deleteById(0);
				
		userService.deleteUser(user.getId());
	}
	
	@Test
	void updateUserTest(){
		user = new User("Test", "test@test.com", "password", (long) 1234567890, "ROLE_USER");
		User testuser = new User("Test", "test@test.com", "password", (long) 1234567890, "ROLE_USER");
		testuser.setUsername("Tested");
		
		when(userRepo.save(testuser)).thenReturn(testuser);		
		User returned = userService.updateUser(testuser);
		
		assertFalse(user.getUsername().equals(returned.getUsername()));
	}
	
	@Test
	void findUserbyUsernameTest() {
		user = new User("Test", "test@test.com", "password", (long) 1234567890, "ROLE_USER");		
		when(userRepo.findByUsername("Test")).thenReturn(user);
		User returned = userService.findUserByUserName("Test");
		
		assertEquals(user, returned);
	}
	
	@Test
	void registerUserTest() {
		user = new User("Test", "test@test.com", "password", (long) 1234567890, "ROLE_USER");
		when(userRepo.save(user)).thenReturn(user);
		User testUser = userService.registerUser(user);
		
		assertEquals(user, testUser);
	}
}
