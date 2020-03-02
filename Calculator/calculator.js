		function dis(val) 
		{ 
			document.getElementById("result").value+=val ;
			
		} 
		function back()
		{
			var result = document.getElementById("result").value
			console.log(result)
			document.getElementById("result").value=result.slice(0,-1);
		}
		//function that evaluates the digit and return result 
		function checkOper(str)
		{
			var oper = ['+','*','-','/','(',')']
			for(var i =0 ; i<oper.length;++i)
			{
				if(str==oper[i])
				{
					return true
				}
			}
			return false
		}
		function prec(c) 
		{ 
			if(c == '^') 
			return 3; 
			else if(c == '*' || c == '/') 
			return 2; 
			else if(c == '+' || c == '-') 
			return 1; 
			else
			return -1; 
		} 
		function infix2post(stk)
		{
			var temp = ['N']
			var post = []
			for(var i=0; i<stk.length;++i)
			{	
				if(checkOper(stk[i])===false)
				{
					post.push(stk[i])
					continue
				}
				else if(stk[i]=='(')
				{
					temp.push(stk[i])
				}
				else if(stk[i]==')')
				{
					while(temp[temp.length-1] != 'N' && temp[temp.length-1] != '(') 
					{ 
						var c = temp[temp.length-1]; 
						temp.pop(); 
						post.push(c);   
						// ns += c; 
					} 
					if(temp[temp.length-1] == '(') 
					{ 
						temp.pop();
					} 
				}
				else if(checkOper(stk[i]))
				{	
					// console.log("operator found",stk[stk.length-1],temp[temp.length-1])
					while(temp[temp.length-1] != 'N' && prec(stk[i])<=prec(temp[temp.length-1])) 
					{ 
						var c = temp[temp.length-1]; 
						temp.pop(); 
						post.push(c);   
						// ns += c; 
					} 
					temp.push(stk[i])
				}
			}

			while(temp[temp.length-1] != 'N') 
			{ 
				var c = temp[temp.length-1]; 
				temp.pop(); 
				post.push(c);   
				// ns += c; 
			} 
			
			return post
		}
		function solve() 
		{ 
			let x = document.getElementById("result").value 
			var oper = ['+','*','-','/','(',')']
			var stk = [];
			for(var i=0; i<x.length;++i)
			{
				// console.log(x[i])
				if(checkOper(x[i]))
				{	
					stk.push(x[i])
					continue
				}
				j = i
				while(j<x.length && (checkOper(x[j])==false))
				{
					j++;
				}
				stk.push(x.slice(i,j))
				i=j-1;
				// console.log(stk,i,j,x)
			}
			
			console.log("After splitting each number and operator",stk)
			post = infix2post(stk)
			console.log("Post fix expression",post)
			// for(var i=0; i<stk.length;++i)
			// {
			// 	console.log(stk[i]+'\n');
			// }			
			// let y = eval(x) 
			// document.getElementById("result").value = y 
			

			temp = ['N']
			for(var i=0;i<post.length;++i)
			{
				// console.log(post[i],temp)
				if(checkOper(post[i])==false)
				{
					temp.push(post[i])
				}
				else
				{
					let b= +temp.pop()
					let a = +temp.pop()
					
					if(post[i]=="+")
					{
						let c= a+b
						// console.log(a,b,c)
						temp.push(c)
					}
					else if(post[i]=="*")
					{
						let c= a*b
						// console.log(a,b,c)
						temp.push(c)
					}
					else if(post[i]=="-")
					{
						let c= a-b
						// console.log(a,b,c)
						temp.push(c)
					}
					else if(post[i]=="/")
					{
						let c= a/b
						// console.log(a,b,c)
						temp.push(c)
					}
					else if(post[i]=="%")
					{
						let c= a%b
						// console.log(a,b,c)
						temp.push(c)
					}
				}
			}
			console.log("Element in stack after evaluation is ",temp[1]);
			document.getElementById("result").value = temp[1]
		}
		//function that clear the display 
		function clr() 
		{ 
			document.getElementById("result").value = "" 
		} 