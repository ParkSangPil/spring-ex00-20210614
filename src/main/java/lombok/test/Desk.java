package lombok.test;

import lombok.EqualsAndHashCode;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@ToString // toString 만 생성자
@EqualsAndHashCode
@RequiredArgsConstructor // final필드만 받아내는 생성자
public class Desk {
	private final double price;
	private final String model;
	private String name;
}
