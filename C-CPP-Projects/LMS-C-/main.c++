#include<iostream>
#include<fstream>
using namespace std;
class temp{
	string id, name, author, search;
	fstream file;
	public:
	void addBook();
	void showBook();
	void extractBook();
}obj;

int main()
{
	char choice;
	cout<<"------------------------------"<<endl;
	cout<<"1. Show All Books "<<endl;
	cout<<"2. Extract Books "<<endl;
	cout<<"3. Add Books(Admin) "<<endl;
	cout<<"4. Exit "<<endl;
	cout<<"------------------------------"<<endl;
	cout<<"Enter Your Choice: ";
	cin>>choice;
	switch(choice)
	{
		case'1':
		cin.ignore();
		obj.showBook();
		break;
		case'2':
		cin.ignore();
		obj.extractBook();
		break;
		case'3':
		cin.ignore();
		obj.addBook();		
		break;
		case'4':
		return 0;
		break;
		default:
			cout<<"Invalid Input...........!"<<endl;
	}
}
void temp :: addBook()
{
cout<<"\nEnter Book Id: ";
getline(cin, id);
cout<<"\nEnter Book Name: ";
getline(cin, name);
cout<<"\nEnter Book Author Name: ";
getline(cin, author);
file.open("book.txt", ios :: out | ios :: app);
file<<id<<'*'<<name<<'*'<<author<<endl;
file.close();
}
void temp :: showBook()
{
file.open("book.txt", ios :: in);
getline(file,id,'*');
getline(file,name,'*');
getline(file,author,'\n');
cout<<"\n\n\n";
cout<<"\t\t Book ID \t\t\t Book Name \t\t\t Author Name "<<endl;
while(!file.eof())
{
cout<<"\t\t"<<id <<"\t\t\t\t"<<name<<"\t\t\t\t"<<author<<endl;
getline(file,id,'*');
getline(file,name,'*');
getline(file,author,'\n');
}	
file.close();
}
void temp :: extractBook()
{
void showBook();
cout<<"Enter Book Id: ";
getline(cin, search);
file.open("book.txt", ios :: in);
getline(file,id,'*');
getline(file,name,'*');
getline(file,author,'\n');
cout<<"\n\n\n";
cout<<"\t\t Book ID \t\t\t Book Name \t\t\t Author Name "<<endl;
while(!file.eof())
{
	if(search==id)
	{
	    cout<<"\t\t"<<id <<"\t\t\t\t"<<name<<"\t\t\t\t"<<author<<endl;	
	    cout<<"\n\n\t\t\tExtract Book Successfully.....!"<<endl;	    
	}	
	getline(file,id,'*');
    getline(file,name,'*');
	getline(file,author,'\n');
}
file.close();
}