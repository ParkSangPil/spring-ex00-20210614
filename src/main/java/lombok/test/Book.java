package lombok.test;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor // 모든 생성자
@NoArgsConstructor // 기본 생성자
public class Book {
	private String title;
	private double price;
}
