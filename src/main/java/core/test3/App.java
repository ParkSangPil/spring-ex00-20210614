package core.test3;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App {

	public static void main(String[] args) {
		String path = "core/test3/core-test3.xml";
		ApplicationContext context = new ClassPathXmlApplicationContext(path);
		
		Hero hero = context.getBean("hero", Hero.class);
		//         context.getBean("hero"); 가 Object로 불러와서 
		//    Hero a = (Hero) context.getBean("hero");를 해줘야 하는데
		//     위에처럼 하면 알아서 형변환 해주기 때문에
		
		System.out.println(hero);
		System.out.println(hero.getSword());
		
		System.out.println("프로그램 종료.");
	}
}
