package days01;

// 같은 패키지안에서 같은 이름의 클래스 생성은 불가능합니다.
// 멤버 메서드 : 클래스에 소속되어 클래스 객체에 종속된 메서드 입니다.

class Animal{
	private String name;
	private int age;
	
	// 멤버 메소드는 특별한 경우를 제외하곤 static 을 사용하지 않습니다.
	// 현재 메소드를 호출하는 호출객체(a1, a1 등)를 별도의 매개변수로 받지 않아도 전달되어져 있습니다.
	public void prn() {
		// 호출 객체는 this 로 전달됩니다. 안보입니다. 모르게 전달됩니다.
		System.out.println("저의 이름은 " + this.name + ", 나이는 " + this.age + "살 입니다.");
	}
	// 멤버 메소드는 같은 클래스내의 private 멤버변수에 자유롭게 접근이 가능합니다.
	
	public void input(String name, int age) {
		this.name = name; // 필드 name과 매개변수 name을 구분하기위해 this사용
		this.age = age;
	}

	
	// 멤버변수, 멤버메소드들은 필요한만큼 자유롭게 정의하여 사용할 수 있습니다.
	/*
	 * public void setName(String name) { this.name = name; } public void setAge(int
	 * age) { this.age = age; } public String getName() { return this.name; } public
	 * int getAge() { return age; }
	 */	
	
	// 위 네 개의 메소드들을 getter/setter 라고 부릅니다.
	// 보통 멤버변수의 값을 저장하거나 얻기위한 메소드인데, 
    // 그 목적만 있다면 메소드이름이 반드시 위와 같지 않아도 무방합니다.
	// 그러나 getter와 setter는 개발자가 호출하여 사용하기도 하지만
	// 시스템이 또는 컴파일러가 사용하기도 하기 떄문에 약속된 이름(get변수이름, set변수이름)을 사용하는것이 일반적입니다.
	
	// 직접 입력해서 생성하면 오타가 있을 수 있으므로 메뉴를 통해 getter/setter를 생성할 수 있습니다.
	
	// 현재위치에서 마우스 우클릭 -> Source -> Generate Getters and Setters
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
}

// private : 클래스 내부에서만 사용가능한 멤버를 정의하는 키워드
// public : 접근에 제한이 없는 멤버를 정의하는 키워드
// protected : child class 에서만 자유롭게 접근이 가능. 상속단원에서 자세히 학습합니다.
// default : 접근 지정자를 지정하지 않으면 자동으로 갖게되는 접근지정자이며,
// 			 같은 패키지내에서 public 처럼 자유롭게 접근 가능합니다. 외부 패키지에서는 private 이나 마찬가지

public class Method01 {

	public static void main(String[] args) {
		Animal a1 = new Animal();
		Animal a2 =new Animal();
//		a1.name = "댕댕이";
//		a1.age = 10;
//		a2.name = "냥냥이";
//		a2.age = 6;
		a1.input("댕댕이", 10);
		a2.input("냥냥이", 6);
//		System.out.println("저의 이름은 " + a1.name + ", 나이는 " + a1.age + "살 입니다.");
		prn(a1);
		a1.prn();
//		System.out.println("저의 이름은 " + a2.name + ", 나이는 " + a2.age + "살 입니다.");
		prn(a2);
		a2.prn();
	}
	
	public static void prn(Animal a1) {
//		System.out.println("저의 이름은 " + a1.name + ", 나이는 " + a1.age + "살 입니다.");
		System.out.println("저의 이름은 " + a1.getName() + ", 나이는 " + a1.getAge() + "살 입니다.");
	}

}
