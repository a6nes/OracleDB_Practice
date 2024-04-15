package days01;

class Student{
	private int bunho;
	private String name;
	private int [] scores;
	private int total;
	private double average;
	
	Student() {
		scores = new int[3];
		name = "홍길남";
		int scores[] = {90, 90, 90};
	}
	Student(String name) {
		this();
		this.name = name;
	}
	Student(String name, int s1, int s2, int s3) {
		this(name);
		int scores[] = {s1, s2, s3};
	}
}
// 생성자 안에서 호출되는 this()는 다른 명령보다 항상 위에 있어야 합니다.
// 순서가 맞지 않으면 에러를 발생합니다.
// 에러 메세지 : Constructor call must be the first statement in a constructor.

public class ClassThis03 {

	public static void main(String[] args) {
		Student std1 = new Student();
		Student std2 = new Student("홍길동");
		Student std3 = new Student("홍길북", 98, 87, 89);

	}

}
