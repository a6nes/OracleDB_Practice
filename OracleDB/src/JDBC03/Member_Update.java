package JDBC03;

import java.util.Scanner;

public class Member_Update {
	
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		System.out.print("수정할 회원의 번호를 입력하세요 : ");
		int membernum = Integer.parseInt(sc.nextLine());
		MemberDao mdao = new MemberDao();
		MemberDto mdto = mdao.getMember(membernum);
		
		if (mdto == null) {
			System.out.println("입력한 멤버번호의 멤버가 존재하지 않습니다.\n프로그램을 종료합니다. ");
			return;
		}
		
		System.out.printf("이름 : %s \n수정할 이름을 입력하세요(수정하지 않으려면 Enter입력) : ", mdto.getName());
		
	}

}
