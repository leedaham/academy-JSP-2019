package sub1;

//�ڹٺ� : form�� �����͸� ����� ���� ��ü
public class UserBean {
	
		//form ������� ����
		private String name;
		private int gender;
		private String[] hobby;
		private String addr;
		
		//��������� Getter, Setter
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		
		public int getGender() {
			return gender;
		}
		public void setGender(int gender) {
			this.gender = gender;
		}
		
		public String[] getHobby() {
			return hobby;
		}
		public void setHobby(String[] hobby) {
			this.hobby = hobby;
		}
		
		public String getAddr() {
			return addr;
		}
		public void setAddr(String addr) {
			this.addr = addr;
		}
		
		
}
