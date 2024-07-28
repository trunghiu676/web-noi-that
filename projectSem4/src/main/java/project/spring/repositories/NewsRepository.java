package project.spring.repositories;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import project.spring.model.News;

public class NewsRepository {
    private static NewsRepository _instance = null;
    private JdbcTemplate db;

    public NewsRepository() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
        dataSource.setUrl(
                "jdbc:mysql://localhost:3306/project_sem4?verifyServerCertificate=false&useSSL=false&requireSSL=false");
        dataSource.setUsername("sem4");
        dataSource.setPassword("sem4");
        db = new JdbcTemplate(dataSource);
    }

    public static NewsRepository Instance() {
        if (_instance == null) {
            _instance = new NewsRepository();
        }
        return _instance;
    }

    class NewsRowMapper implements RowMapper<News> {
        @Override
        public News mapRow(ResultSet rs, int rowNum) throws SQLException {
            News item = new News();
            item.setId(rs.getInt(News.ID));
            item.setName(rs.getString(News.NAME));
            item.setDescription(rs.getString(News.DESCRIPTION));
            item.setContent(rs.getString(News.CONTENT));
            item.setImage(rs.getString(News.IMAGE));
            item.setPath(rs.getString(News.PATH));
            item.setAccountId(rs.getInt(News.ACCOUNTID));
            item.setKeyword(rs.getString(News.KEYWORD));
            item.setMetaTitle(rs.getString(News.METATITLE));
            item.setMetaDescription(rs.getString(News.METADESCRIPTION));
            item.setIndex(rs.getBoolean(News.INDEX));
            item.setCreatedAt(rs.getDate(News.CREATEDAT));
            return item;
        }
    }

    //lấy tất cả bài viết
    public List<News> findAll() {
        return db.query("select * from news order by id desc", new NewsRowMapper());
    }

    //Lấy bài viết + tên người viết
    public List<Map<String, Object>> findAllByAccount() {
        String query = "SELECT news.id, news.image, news.name, news.index, accounts.fullName FROM news INNER JOIN accounts ON news.accountId = accounts.id ORDER BY news.id DESC";
        return db.queryForList(query);
    }
    
    //lấy ra 4 bài viết mới nhất
    public List<News> findRecent() {
        return db.query("SELECT * FROM news ORDER BY id DESC LIMIT 4", new NewsRowMapper());
    }

    //lấy ra 3 bài viết ngẫu nhiên
    public List<News> findRand() {
        return db.query("SELECT * FROM news ORDER BY RAND() LIMIT 3;", new NewsRowMapper());
    }

    @SuppressWarnings("deprecation")
    public List<News> findAllByPage(int page, int pageSize) { // lấy danh sách bài viết trong 1 trang
        int start = page * pageSize;
        return db.query("SELECT * FROM news ORDER BY id DESC LIMIT ?, ?", new Object[] { start, pageSize }, new NewsRowMapper());
    }

    public int getTotalPages(int pageSize) { // tổng số trang
        int totalCount = db.queryForObject("SELECT COUNT(*) FROM news", Integer.class);
        return (int) Math.ceil((double) totalCount / pageSize);
    }

    public News findById(int id) {
        return db.queryForObject("select * from news where Id=?", new NewsRowMapper(), new Object[] { id });
    }

    public News findByPath(String path) {
        return db.queryForObject("select * from news where path = ?", new NewsRowMapper(), new Object[] { path });
    }

    //Tìm kiếm tin tức
    @SuppressWarnings("deprecation")
    public List<News> search(String keyword) {
        String sql = "SELECT * FROM news WHERE Name LIKE ?";
        String searchKeyword = "%" + keyword + "%"; // Thêm ký tự % để tìm kiếm một phần của tên
        return db.query(sql, new Object[] { searchKeyword }, new NewsRowMapper());
    }

    public int deleteById(int id) {
        return db.update("delete from news where Id=?", new Object[] { id });
    }

    public int insert(News newNews) {
        // Thêm dữ liệu vào cơ sở dữ liệu và lấy ID của bản ghi mới
        KeyHolder keyHolder = new GeneratedKeyHolder();
        db.update(connection -> {
            PreparedStatement ps = connection.prepareStatement(
                "INSERT INTO news (name, description, content, image, path, accountId, keyword, metaTitle, metaDescription, `index`, createdAt) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())",
                Statement.RETURN_GENERATED_KEYS
            );
            ps.setString(1, newNews.getName());
            ps.setString(2, newNews.getDescription());
            ps.setString(3, newNews.getContent());
            ps.setString(4, newNews.getImage());
            ps.setString(5, newNews.getPath());
            ps.setInt(6, newNews.getAccountId());
            ps.setString(7, newNews.getKeyword());
            ps.setString(8, newNews.getMetaTitle());
            ps.setString(9, newNews.getMetaDescription());
            ps.setBoolean(10, newNews.isIndex());
            return ps;
        }, keyHolder);
    
        // Lấy ID của bản ghi mới
        int newId = keyHolder.getKey().intValue();
    
        // Cập nhật path của bản ghi mới
        updatePath(newId, newNews.getPath() + "-" + newId);
    
        return newId;
    }
    
    
    

    public void updatePath(int id, String newPath) {
        db.update("update news set path = ? where id = ?", newPath, id);
    }

    public int update(News upNews) {
        return db.update(
                "update news set name = ?, description = ?, content = ?, image = ?, path = ?, keyword = ?, metaTitle = ?, metaDescription = ?, `index` = ? where Id = ?",
                new Object[] { 
                    upNews.getName(), 
                    upNews.getDescription(), 
                    upNews.getContent(), 
                    upNews.getImage(),
                    upNews.getPath(), 
                    upNews.getKeyword(), 
                    upNews.getMetaTitle(), 
                    upNews.getMetaDescription(),
                    upNews.isIndex(), 
                    upNews.getId() 
                });
    }
    

    //Kiểm tra có trùng tên hay không
    public boolean isNewsNameExists(String name) {
        int count = db.queryForObject("SELECT COUNT(*) FROM news WHERE name = ?", Integer.class, name);
        return count > 0;
    }
    
}
