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

import com.hclfsd.team10jan.capstone.entities.Genre;
import com.hclfsd.team10jan.capstone.repositories.GenreRepository;
import com.hclfsd.team10jan.capstone.services.GenreService;

@RunWith(SpringRunner.class)
@SpringBootTest
public class GenreServiceTester {

	@MockBean
	GenreRepository genreRepo;
	
	@Mock
	Genre genre;
	
	@Autowired
	GenreService genreService;
	
	@Before
	void setUp() {
		Mockito.mockConstruction(Genre.class);

	}
	
	@Test
	void getAllGenresTest() {
		genre = new Genre();
		genre.setId(1); genre.setName("Test");
		ArrayList<Genre> testarr = new ArrayList<Genre>();
		testarr.add(genre);
		when(genreRepo.findAll()).thenReturn(testarr);
		
		Iterable<Genre> genres = genreService.getAllGenres();
		for (Genre i: genres) {
			assert(i.getName().equals("Test"));
		}
	}

	@Test
	void deleteGenreTest() {
		genre = new Genre();
		genre.setId(0); genre.setName("Test");
		ArrayList<Genre> testarr = new ArrayList<Genre>();
		testarr.add(genre);
		
		doAnswer(invocation -> {
			Object arg0 = invocation.getArgument(0);
			for (Genre i: testarr) {
				assert(i.getId() == arg0);
			}
			return null;
		}).when(genreRepo).deleteById(0);
		
		genreService.deleteGenre(genre.getId());
	}
	
	@Test
	void saveGenreTest() {
		genre = new Genre();
		genre.setId(1); genre.setName("Test");
		when(genreRepo.save(genre)).thenReturn(genre);
		
		Genre returned = genreService.saveGenre(genre);
		assertEquals(returned, genre);
	}
	
	@Test
	void getGenreByIdTest() {
		genre = new Genre();
		genre.setId(1); genre.setName("Test");
		Optional<Genre> object = Optional.of(genre);
		
		when(genreRepo.findById(1)).thenReturn(object);
		
		Genre returned = genreService.findById(1);
		
		assert(returned != null);
	}
}
