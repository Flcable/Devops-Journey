package main

import (
	"fmt"
	"log"
	"net/http"
	"net/url"
	"os"
)

func main() {
	args := os.Args

	if len(args) < 2 {
		fmt.Printf("Usage: ./hello-world <argument>\n")
		os.Exit(1)
	}

	if _, err := url.ParseRequestURI(args[1]); err != nil {
		fmt.Printf("Url is invalid format: %s\n", err)
		os.Exit(1)
	}

	response, err := http.Get(args[1])

	if err != nil {
		log.Fatal(err)
	}

	defer response.Body.Close()

	fmt.Printf("Hello world\nos.Args: %v\nArgument: %v", args, args[1:])

}
