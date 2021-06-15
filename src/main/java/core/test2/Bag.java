package core.test2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import lombok.Getter;

//@Component("bag")
@Component // 위나 아래나 똑같다
@Getter
public class Bag {
	
	private Book book;
	
//	@Autowired
	public Bag(Book book) {
		this.book = book;
	}

	@Override
	public String toString() {
		return "Bag [book=" + book + "]";
	}
	
//	@Autowired
	public void setBook(Book book) {
		this.book = book;
	}
	
	
}
