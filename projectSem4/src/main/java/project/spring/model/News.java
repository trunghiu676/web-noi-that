package project.spring.model;

import java.util.Date;

public class News {
    private int id;  // Mã tin tức - Khóa chính
    private String name;  // Tên bài viết
    private String description;  // Mô tả ngắn
    private String content;  // Nội dung bài viết
    private String image;  // Ảnh đại diện bài viết
    private String path;  // Đường dẫn 
    private int accountId;  // Mã người tạo
    private String keyword;  // Từ khóa SEO
    private String metaTitle;  // Tiêu đề SEO
    private String metaDescription;  // Mô tả SEO
    private boolean index;  // Index (SEO)
    private Date createdAt;  // Ngày tạo

    public static String ID = "id";
    public static String NAME = "name";
    public static String DESCRIPTION = "description";
    public static String CONTENT = "content";
    public static String IMAGE = "image";
    public static String PATH = "path";
    public static String ACCOUNTID = "accountId";
    public static String KEYWORD = "keyword";
    public static String METATITLE = "metaTitle";
    public static String METADESCRIPTION = "metaDescription";
    public static String INDEX = "index";
    public static String CREATEDAT = "createdAt";

    public News(int id, String name, String description, String content, String image, String path, int accountId, String keyword, String metaTitle, String metaDescription, boolean index, Date createdAt) {
        super();
        this.id = id;
        this.name = name;
        this.description = description;
        this.content = content;
        this.image = image;
        this.path = path;
        this.accountId = accountId;
        this.keyword = keyword;
        this.metaTitle = metaTitle;
        this.metaDescription = metaDescription;
        this.index = index;
        this.createdAt = createdAt;
    }

    public News() {
        super();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getMetaTitle() {
        return metaTitle;
    }

    public void setMetaTitle(String metaTitle) {
        this.metaTitle = metaTitle;
    }

    public String getMetaDescription() {
        return metaDescription;
    }

    public void setMetaDescription(String metaDescription) {
        this.metaDescription = metaDescription;
    }

    public boolean isIndex() {
        return index;
    }

    public void setIndex(boolean index) {
        this.index = index;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
}
