package post.calc;

public class MulOperator implements Operator {

	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return "*";
	}

	@Override
	public double execute(double a, double b) throws Exception {
		// TODO Auto-generated method stub
		return a * b;
	}

}
