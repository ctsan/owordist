(* Author: C.Tsanikidis <ctsanikidis@gmail.com> *)

open Core.Std

module H = Hashtbl
module S = String

let indicator a b =
    if a = b then 0
    else 1

(* Takes two strings, computes their leve distance *)
let dist w1 w2 =
    let ht = H.Poly.create () in
    let sz1 = S.length w1 in
    let sz2 = S.length w2 in
    let rec lev n1 n2 = 
        match H.find ht (n1,n2) with
        | None -> 
            let data = 
                if min n1 n2 < 0 then
                    1 + max n1 n2
                else begin
                    let v1 = 1 + lev (n1-1) n2 in
                    let v2 = 1 + lev n1 (n2-1) in 
                    let v3 = 
                        indicator w1.[n1] w2.[n2] 
                        + lev (n1-1) (n2-1) 
                    in min v1 @@ min v2 v3
                end
            in
            Hashtbl.set ht ~key:(n1,n2) ~data;
            data
        | Some res -> res
    in lev (sz1-1) (sz2-1)

let () = 
    if Array.length Sys.argv <> 3 then 
        (
         eprintf "Usage:\n\t./executable word1 word2\n"; 
         exit 1
        )
    else
    let w1 = Sys.argv.(1) in
    let w2 = Sys.argv.(2) in
    dist w1 w2 |> printf "%d\n";
    exit 0
