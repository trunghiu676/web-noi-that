package project.spring.controller;

import java.util.List;
import java.util.Map;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project.spring.model.News;
import project.spring.repositories.NewsRepository;

@Controller
@RequestMapping("/admin/news")
public class NewsController {
    @GetMapping("")
    public String getAllNews(Model model) {
        // List<News> news = NewsRepository.Instance().findAll();
        List<Map<String, Object>> news = NewsRepository.Instance().findAllByAccount();
        model.addAttribute("news", news);
        return "forderAdmin/news";
    }

    // @GetMapping("")
    // public String getAllnews(@RequestParam(defaultValue = "1") int page, Model model) {
    //     int pageSize = 1; // Số lượng mục trên mỗi trang
    //     List<News> news = NewsRepository.Instance().findAllByPage(page - 1, pageSize);
    //     int totalPages = NewsRepository.Instance().getTotalPages(pageSize);
    //     model.addAttribute("news", news);
    //     model.addAttribute("totalPages", totalPages);
    //     model.addAttribute("currentPage", page); // Trang hiện tại
    //     return "Admin/news";
    // }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("news", new News());
        return "forderAdmin/add-news";
    }

    @PostMapping("/add")
    public String addNews(@ModelAttribute("news") News news, Model model) {
        news.setAccountId(1);
        
        // Kiểm tra xem tên bài viết đã tồn tại chưa
        // if (NewsRepository.Instance().isNewsNameExists(news.getName())) {
        //     // Nếu tên bài viết đã tồn tại, hiển thị thông báo lỗi và giữ nguyên dữ liệu người dùng nhập
        //     model.addAttribute("error", "Tên bài viết đã tồn tại");
        //     model.addAttribute("news", news); // Giữ nguyên dữ liệu người dùng nhập
        //     return "forderAdmin/add-news";
        // }
        
        // Nếu tên bài viết chưa tồn tại, thêm bài viết mới vào cơ sở dữ liệu
        NewsRepository.Instance().insert(news);
        
        return "redirect:/admin/news";
    }
    

    @GetMapping("/edit")
    public String showEditForm(@RequestParam("id") int id, Model model) {
        News news = NewsRepository.Instance().findById(id);
        model.addAttribute("news", news);
        return "forderAdmin/edit-news";
    }

    @PostMapping("/edit")
    public String updateNews(@ModelAttribute("news") News news) {
        NewsRepository.Instance().update(news);
        return "redirect:/admin/news";
    }
    

    @GetMapping("/delete/{id}")
    public String deleteNews(@PathVariable("id") int id) {
        NewsRepository.Instance().deleteById(id);
        return "redirect:/admin/news";
    }

}
