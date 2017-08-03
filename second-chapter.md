# Greatness

This is a test

```Go
	fmt.Println("username:", template.HTMLEscapeString(r.Form.Get("username"))) // print at server side
	fmt.Println("password:", template.HTMLEscapeString(r.Form.Get("password")))
	template.HTMLEscape(w, []byte(r.Form.Get("username"))) // responded to clients
```



