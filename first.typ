// 著者：     秦宇轩 (Qin Yuxuan)
// 最后修改：  2024年 05月 18日 星期六 21:26:35 CST
// 协议：     MIT Liscense
//
// 这是模板文件，详见函数 `conf`，配置相关条目前一律加全大写
// 的函数名，以便查找。
// 费解的配置一律加注释。

#let conf(
  lang: [],
  title: none,
  authors: (),
  date: datetime.today(),
  abstract: [],
  keywords: (),
  doc
) = {
  // TEXT
  set text(
  font: ("New Computer Modern", "Noto Serif CJK SC"),
  size: 12pt,
  lang: lang)  // Depends on the `lang` argument you pass

  // PAGE
  set page(
  paper: "a4",
  numbering: "1")
  
  // PARAGRAPH
  set par(
  justify: true,  // Justify every line, so sentence won't pill out
  leading: 0.5em,  // Space between each line
  first-line-indent: if lang == "zh" {2em} else {1em})  
  set heading(numbering: "1.")  // Sections' number

  // CODE MODE
  show raw: set text(font: "Fira Code")  // font
  show raw.where(block: true): block.with(  // code block
    fill: luma(220),  // background color
    inset: 9pt)  // distance between text and the edge
  show raw.where(block: false): box.with(  // inline
    fill: luma(220),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt)

  // LINK
  show link: it => text(red, font: "Fira Code", size: 10pt)[#it]
  
/*-----------------------------------------------------*/
/*-----------------------------------------------------*/
/*--------------- DEFINE FUNCTION BEGIN ---------------*/
/*-----------------------------------------------------*/
/*-----------------------------------------------------*/

  // PROOF


/* --------------------------------------------------- */
/* --------------------------------------------------- */
/* ----------------- Docuemnt Begin ------------------ */
/* --------------------------------------------------- */
/* --------------------------------------------------- */



  set align(center)
  text(25pt)[*#title*]
  
  let count = authors.len()
  let ncols = calc.min(count, 3)
  grid(
    columns: (1fr,) * ncols,
    row-gutter: 24pt,
    ..authors.map(author => [
      #text(size: 16pt)[#author.name]\
      #author.affiliation \
      #link("mailto:" + author.email)
    ]),
  )

  [#date.year()-#date.month()-#date.day()\ ]
  [
    \
  ]
  set align(left)
 
  if lang == "zh" {
    par(first-line-indent: 0em)[*摘要*： #abstract]
  } else {
    [*Abstract*: #abstract]
  }
  

  // outline 
  show outline.entry: it => {
    if it.level == 1 {  
      strong(text(red)[#it])
    } else {
      text(red)[#it]
    }
  }

  [
    \
    \
    \
  ]

  outline(
  indent: auto,
  fill: repeat("  ·  "),
  depth: 2
  )



  doc

}


#show: doc => conf(
  lang: "zh",
  title: "寻找塔菲",
  authors: (
    (
      name: "孙笑川",
      affiliation: "抽象研究院",
      email: "laugh@chuan.net"
    ),
  ),
  abstract: [在这片文章中，我们实现实现了实现了实现了实现了实现了实现了实现了实现了实现了实现了实现了实现了实现了实现了实现了实现了实现了实现了实现了实现了了],
  doc
)


#let thm(title: [], content) = block(
  fill: silver, 
  inset: 10pt,
  stroke: black)[
    #text(size: 16pt)[*#title*]\
    #line(length: 100%, stroke: 0.7pt)
    #content
  ]



= 引言
With `rg`, you can search through your files quickly.
This example searches the current directory recursively
for the text  can can can can can can  `Hello World`:

```hs
main :: IO ()
main = do
  putStrLn "Hello World"
```
= 塔菲是谁
#lorem(20) 现在让我们来看看孙笑川大定理：


#set quote(block: true)
#thm(title: "测度扩张定理")[
  每个定义在代数 $cal(A)$ 上的 “预测度” $mu$ 都能扩充成一个真测度。 
]
#let lang = context text.lang

#lang
 
#let proof(content) = [
  #if lang != "zh" {
    [*证明*.
    #content $qed$]
  } else {
    [*Proof*.
    #content $qed$]
  }
]

#proof[
  快使用算小川，呼呼哈黑。
  $s d d $\
  我是孙姓爱我实训消除我实训消除我实训消除我实训消除我实训消除我实训消除我实训消除我实训消除我实训消除我实训消除我实训消除我实训消除我实训消除我实训消除我实训消除我实训消除我实训消除我实训消除我实训消除我实训消除穿
  这是新的一行 
]