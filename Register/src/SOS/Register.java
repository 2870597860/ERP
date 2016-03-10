package SOS;

import java.io.DataOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.*;
import java.io.*;
/**
 * Servlet implementation class Register
 */
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		String SensorID=request.getParameter("SensorID");
		Socket socket;
		BufferedReader in;
		PrintWriter out_;
		try{
		socket = new Socket("202.121.197.111", 82); 
		in = new BufferedReader(new InputStreamReader(socket.getInputStream())); 
		out_ = new PrintWriter(socket.getOutputStream(),true); 
		BufferedReader line = new BufferedReader(new InputStreamReader(System.in)); 
		
//		out.println(line.readLine()); 
		out_.println("SensorID,,"+SensorID); 
		line.close(); 
		out_.close(); 
		in.close(); 
		socket.close(); 
		}catch(IOException e){
			
		}
		out.println("<html>");
		out.println("<head>");
		out.println("<title>HelloServlet</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>Hello!"+SensorID+"!</h1>");
		out.println("</body>");
		out.println("</html>");
		
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
