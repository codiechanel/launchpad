# Second Chapter

GitBook allows you to organize your book into chapters, each chapter is stored in a separate file like this one.

```Go
	fmt.Println("username:", template.HTMLEscapeString(r.Form.Get("username"))) // print at server side
	fmt.Println("password:", template.HTMLEscapeString(r.Form.Get("password")))
	template.HTMLEscape(w, []byte(r.Form.Get("username"))) // responded to clients
```
