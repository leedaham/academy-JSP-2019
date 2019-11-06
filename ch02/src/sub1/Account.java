package sub1;

public class Account { //멤버 변수 4개, 멤버 메서드 3개 = 총 7개 멤버

	//특성 (멤버 변수) - 캡슐화 해야한다.(private)
	public String bank;
	public String id;
	public String name;
	public int money;
	
	//생성자 - 객체 생성 할 때 멤버변수를 초기화하는 메서드
	public Account(String bank, String id, String name, int money) {
		this.bank = bank;
		this.id = id;
		this.name = name;
		this.money = money;
	}
	
	//기능 (멤버 메서드)
	public void deposit(int money) {
		this.money += money;
	}
	
	public void withdraw(int money) {
		this.money -= money;
	}
	
	
}
