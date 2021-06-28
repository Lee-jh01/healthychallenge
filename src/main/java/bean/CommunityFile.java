package bean;

public class CommunityFile {
	
	private int b_filenum;
	
	private int co_seq;
	
	private String o_name;
	
	private String file_name;
	
	private int file_size;

	public int getB_filenum() {
		return b_filenum;
	}

	public void setB_filenum(int b_filenum) {
		this.b_filenum = b_filenum;
	}

	public int getCo_seq() {
		return co_seq;
	}

	public void setCo_seq(int co_seq) {
		this.co_seq = co_seq;
	}

	public String getO_name() {
		return o_name;
	}

	public void setO_name(String o_name) {
		this.o_name = o_name;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public int getFile_size() {
		return file_size;
	}

	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}

	@Override
	public String toString() {
		return "CommunityFile [b_filenum=" + b_filenum + ", co_seq=" + co_seq + ", o_name=" + o_name + ", file_name="
				+ file_name + ", file_size=" + file_size + "]";
	}

	public CommunityFile(int b_filenum, int co_seq, String o_name, String file_name, int file_size) {
		super();
		this.b_filenum = b_filenum;
		this.co_seq = co_seq;
		this.o_name = o_name;
		this.file_name = file_name;
		this.file_size = file_size;
	}


  
}
