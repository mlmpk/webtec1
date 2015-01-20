package tags;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class GgtTagHandler extends SimpleTagSupport {

	private int zahl1;
	private int zahl2;

	public GgtTagHandler() {

	}

	@Override
	public void doTag() throws JspException, IOException {
		JspWriter out = getJspContext().getOut();

		if (zahl1 == 0) {
			out.print(zahl2);
		} else {
			while (zahl2 != 0) {
				if (zahl1 > zahl2) {
					zahl1 = zahl1 - zahl2;
				} else {
					zahl2 = zahl2 - zahl1;
				}

			}
			out.print(zahl1);
		}

	}

	public int getZahl1() {
		return zahl1;
	}

	public void setZahl1(int zahl1) {
		this.zahl1 = zahl1;
	}

	public int getZahl2() {
		return zahl2;
	}

	public void setZahl2(int zahl2) {
		this.zahl2 = zahl2;
	}

}
