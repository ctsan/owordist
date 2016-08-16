all: dist.ml
	ocamlbuild -r -use-ocamlfind -tag "thread" -pkgs 'core' dist.native
	rm dist.native
	mv _build/dist.native dist

clean: 
	rm dist
	rm -rf _build
