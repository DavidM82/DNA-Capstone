package com.hclfsd.team10jan.capstone.integration;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.doAnswer;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.Optional;

import org.junit.Before;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;

import com.hclfsd.team10jan.capstone.entities.Category;
import com.hclfsd.team10jan.capstone.repositories.CategoryRepository;
import com.hclfsd.team10jan.capstone.services.CategoryService;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CategoryServiceTester {

	@MockBean
	private CategoryRepository categoryRepo;
	
	@Mock
	private Category category;
	
	@Autowired
	CategoryService categoryService;
	
	@Before
	void setUp() {
		Mockito.mockConstruction(Category.class);

	}
	
	@Test
	void getAllCategoriesTest() {
		category = new Category();
		category.setId(0); category.setName("Test"); category.setGenre(null);
		ArrayList<Category> testarr = new ArrayList<Category>();
		when(categoryRepo.findAll()).thenReturn(testarr);
		Iterable<Category> categories = categoryService.getAllCategories();
		for (Category i: categories) {
			assert(i.getName().equals("Test"));
		}
	}
	
	@Test
	void deleteCategoryTest() {
		category = new Category();
		category.setId(0); category.setName("Test"); category.setGenre(null);		
		ArrayList<Category> testarr = new ArrayList<Category>();
		testarr.add(category);
		
		doAnswer(invocation -> {
			Object arg0 = invocation.getArgument(0);
			for (Category i: testarr) {
				assert(i.getId() == arg0);
			}
			return null;
		}).when(categoryRepo).deleteById(0);
		
		categoryService.deleteCategory(category.getId());
	}
	
	@Test
	void saveCategoryTest() {
		category = new Category();
		category.setId(0); category.setName("Test"); category.setGenre(null);		
		
		when(categoryRepo.save(category)).thenReturn(category);
		
		Category returned = categoryService.saveCategory(category);
		assertEquals(returned, category);
	}
	
	@Test
	void findByIdTest() {
		category = new Category();
		category.setId(0); category.setName("Test"); category.setGenre(null);		
		Optional<Category> object = Optional.of(category);
		
		when(categoryRepo.findById(0)).thenReturn(object);
		
		Category returned = categoryService.findById(0);
		
		assert(returned != null);
	}
}
