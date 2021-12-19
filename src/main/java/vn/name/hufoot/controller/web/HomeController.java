package vn.name.hufoot.controller.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import vn.name.hufoot.dto.ProductDTO;
import vn.name.hufoot.entity.ProductEntity;
import vn.name.hufoot.service.ICategoryService;
import vn.name.hufoot.service.INewsService;
import vn.name.hufoot.service.IProductService;

@Controller(value = "homeControllerOfWeb")
public class HomeController {

	@Autowired
	private ICategoryService categoryService;
	
	@Autowired
	private IProductService productService;
	
	@Autowired
	private INewsService newsService;
	

	@RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
	public ModelAndView homePage(@RequestParam("page") int page, 
								 @RequestParam("limit") int limit) {
		
		ProductDTO model = new ProductDTO();
		model.setPage(page);
		model.setLimit(limit);
		ModelAndView mav = new ModelAndView("web/home");
		Pageable pageable = new PageRequest(page - 1, limit);
		model.setListResult(productService.findAll(pageable));
		model.setTotalItem(productService.getTotalItem());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		mav.addObject("model", model);
		mav.addObject("categories", categoryService.findAlls());
		return mav;
	}

	@RequestMapping(value = "/showlist", method = RequestMethod.GET)
	public ModelAndView showList(@RequestParam(value = "id", required = false) Long id, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("web/showlist");
		List<ProductEntity> model = productService.findByCategoryID(id);
		mav.addObject("model", model);
		mav.addObject("categories", categoryService.findAlls());
		mav.addObject("categori", categoryService.findById(id));
		return mav;
	}
	
	@RequestMapping(value = "/details", method = RequestMethod.GET)
	public ModelAndView Details(@RequestParam(value = "id", required = false) Long id, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("web/details");
		mav.addObject("details", productService.findById(id));
		mav.addObject("categories", categoryService.findAlls());
		
		return mav;
	}
	
	@RequestMapping(value = "/searchlist", method = RequestMethod.GET)
	public ModelAndView searchlist(@RequestParam(value = "keyword", required = false) String keyword, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("web/searchlist");
		mav.addObject("search", productService.search(keyword));
		mav.addObject("categories", categoryService.findAlls());
		mav.addObject("key", keyword);
		return mav;
	}
	
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public ModelAndView contact(){
		ModelAndView mav = new ModelAndView("web/contact");
		mav.addObject("categories", categoryService.findAlls());
		return mav;
	}
	@RequestMapping(value = "/news", method = RequestMethod.GET)
	public ModelAndView news(){
		ModelAndView mav = new ModelAndView("web/news");
		mav.addObject("news", newsService.findAlls());
		mav.addObject("categories", categoryService.findAlls());
		return mav;
	}


}