package bean;

public class ChallengeFile {
	private int filenum;
	private int cr_seq;
	private String o_name;
	private String file_name;
	private int file_size;

	public int getFilenum() {
		return filenum;
	}

	public void setFilenum(int filenum) {
		this.filenum = filenum;
	}

	public int getCr_seq() {
		return cr_seq;
	}

	public void setCr_seq(int cr_seq) {
		this.cr_seq = cr_seq;
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
		return "Challenge_File [filenum=" + filenum + ", cr_seq=" + cr_seq + ", o_name=" + o_name + ", file_name="
				+ file_name + ", file_size=" + file_size + "]";
	}

	public ChallengeFile(int filenum, int cr_seq, String o_name, String file_name, int file_size) {
		super();
		this.filenum = filenum;
		this.cr_seq = cr_seq;
		this.o_name = o_name;
		this.file_name = file_name;
		this.file_size = file_size;
	}

	public ChallengeFile() {
		// TODO Auto-generated constructor stub
	}

}
