package bb2;

import java.sql.Timestamp;

public class BoardDataBean {
	private int num;
	private String id;
	private String subject;
	private String content;
	private String passwd;
	private String boardid;
	private Timestamp re_date;
	private int readcount;
	private String ip;
	private int ref;
	private int re_step;
	private int re_level;
	private String filename;
	private int filesize;
	
	public int getNum() {
		return num;
	}
	public String getId() {
		return id;
	}
	public String getSubject() {
		return subject;
	}
	public String getContent() {
		return content;
	}
	public String getPasswd() {
		return passwd;
	}
	public String getBoardid() {
		return boardid;
	}
	public Timestamp getRe_date() {
		return re_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public String getIp() {
		return ip;
	}
	public int getRef() {
		return ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public String getFilename() {
		return filename;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public void setBoardid(String boardid) {
		this.boardid = boardid;
	}
	public void setRe_date(Timestamp re_date) {
		this.re_date = re_date;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	@Override
	public String toString() {
		return "BoardDataBean [num=" + num + ", id=" + id + ", subject=" + subject + ", content=" + content
				+ ", passwd=" + passwd + ", boardid=" + boardid + ", re_date=" + re_date + ", readcount=" + readcount
				+ ", ip=" + ip + ", ref=" + ref + ", re_step=" + re_step + ", re_level=" + re_level + ", filename="
				+ filename + ", filesize=" + filesize + "]";
	}
	
	
	
	
	

}
