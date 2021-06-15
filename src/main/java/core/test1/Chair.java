package core.test1;

/*import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@ToString
@NoArgsConstructor*/
public class Chair {
	private Leg leg;

	public Chair() {
			
	}
	
	public Chair(Leg leg) {
		this.leg = leg;
	}
	
	@Override
	public String toString() {
		return "Chair [leg=" + leg + "]";
	}
	
	
}
