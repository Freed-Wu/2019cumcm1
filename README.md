2019cumcm1
==========

A backup of my homework. 2019 国赛本校第1次选拔赛。

因为要涉及到多人合作的缘故，有必要把格式和风格的一些冲突的地方统一一下。

文件格式
--------

### 重要的

#### 文字

1.  写完一段空一行。这样比`\par\indent` 更整洁。
2.  双引号建议用 `\enquote{...}` 取代“...”。因为后者容易出错出现”...”。
3.  中英文之间增加空格等等，参见[中文文案排版指北（简体中文版）]

> 「有研究显示，打字的时候不喜欢在中文和英文之间加空格的人，感情路都走得很辛苦，有七成的比例会在 34 岁的时候跟自己不爱的人结婚，而其余三成的人最后只能把遗产留给自己的猫。毕竟爱情跟书写都需要适时地留白。与大家共勉之。」——vinta/paranoid-auto-spacing

#### 数学公式

1.  如果是图片中的公式用mathpix 自动导出tex 格式的公式，不用自己写。
2.  行内公式建议用 `$...$` 不用 `\(...\)`。行间公式建议 `\dfrac` 取代 `\frac`。
3.  行间公式建议用 `\begin{align}` 不用`$$...$$`，`\[...\]`没有编号。[知乎]上有截图说明以上部分区别。
4.  `\sum` 后建议用 `\limits`。建议用 `\max`, `\min`, `\ln` 取代 `\mathrm{max}` 等。
5.  建议用 `\dv{}{t}x` 取代`\frac{\mathrm{d}}{\mathrm{d}t}x`。偏微分则是 `\pdv{}{t}x` 。
6.  建议用`\begin{subnumcases}{}`写分段函数。
7.  建议用`\SI{1}{km}`取代`1km`。
8.  建议用`\mathrm{}`取代`\text{}`。
9.  [公式查看]见这个网站。

#### 图片

1.  **图片**优先使用 **矢量图**。互联网下的图一般都是jpg。截图一般是png。但自己绘图能用矢量图就不要用点阵图。特别谢绝bmp（tex 不支持）。
2.  矢量图如果是matlab、octave、py 画的导出为eps 或pdf 都行。inkscape、Photoshop 同理。（ *矢量图pdf 比eps 兼容性好，但有时要裁剪白边有点麻烦* ）。矢量图如果是（dia、latexdraw）导出为tikz、pst 再编译为pdf。矢量图如果是visio 画的直接打印为pdf。
3.  图片和 **画出该图片的源文件**（matlab 代码、tikz 的tex 文件、visio 文件等）一起放在 **src** 文件夹下。
4.  简单的流程图、思维导图、电路图能用tikz 画就用tikz 画， **见示范的tex文件**。复杂的可以用dia 等软件画。
5.  **能截图就不要拍照。能导出矢量图就不要截图。**（例如示波器的波形图就可以截图。 *最好使用FAT32的U盘* ）
6.  图片上不用带标题，在 `\begin{figure}` 中的 `\caption{...}` 中说明标题。
7.  标题为`\caption{...}` 的图片，标签为 `\label{fig:...}` 。表格、公式、代码、章、节等分别把fig 改为tab、eq、code、cha、sec、sub、ssub、par、spar 等。
8.  相关联的图片、表格在 `\begin{figure}` 和 `\begin{table}`中使用 `\begin{subfigure}` 和 `\begin{subtable}` ，引用时用`\subref{fig:...}` 引用子图。用 `\ref{...}` 中引用总图。

#### 表格

1.  **不建议一个字一个字把表格敲成tex。**表格中如果没有合并单元格就导成csv 用csvreader 导入。否则直接用 `\begin{table}` 插入。 **能直接导入就不要自己打字**， **见示范的tex文件**。tex 支持csv，不支持xls、xlsx。

``` {.tex}
\begin{table}[htbp]
    \centering
    \caption{每个省份乘坐高铁人数与乘坐火车人数之比}
    \label{tab:每个省份乘坐高铁人数与乘坐火车人数之比}
    \csvreader[
    head to column names,
    tabular=cc,
    table head=\toprule
    省份&高铁乘客人数/火车乘客人数比值
    \\
    \midrule,
    table foot=\bottomrule
    ]{src/ratio.csv}{}{\csvcoli&\csvcolii} %直接导入表格
\end{table}
```

或者更简单的：

``` {.tex}
\begin{table}[htbp]
    \centering
    \caption{每个省份乘坐高铁人数与乘坐火车人数之比}
    \label{tab:每个省份乘坐高铁人数与乘坐火车人数之比}
    \csvautobooktabular{src/ratio.csv}
\end{table}
```

2.  maltab 导出的表格不含文字用csvwrite 否则用xlswrite。matlab 不支持导出含文字的csv。但可以用importdata 导入含文字的csv。
3.  建议使用三线表。
4.  当表格过长时使用 `\begin{longtabu}`。
5.  建议用 `\begin{tabu}` 取代 `\begin{tabular}` 。
6.  [表格转换]见这个网站。

### 一般般，看不懂就跳过

1.  简单的空格用 `~` 就行。
2.  matlab2tikz 支持从matlab 导出tikz。但文字导出有些问题。目前不太建议。
3.  tex 不支持psd、fig、svg。
4.  使用`\begin{subfigure}` 和 `\begin{subtable}`时如果要跨页需要改计数器。
5.  代码建议用google 风格。
6.  代码排版用了boxie.sty。出自texstudio。依赖pygmentize。需要--shell-escape。
7.  参考文献用 `\bibliography{src/main}` 导入。将main.bib 放到src 文件夹下。

文件结构
--------

### 重要的

1.  **tex主文件**就直接放在 **工作文件夹**下。
2.  要插入的图片等 **素材**统一放在 **src** 文件夹下。
3.  清理干净编译时生成的临时文件（\*.aux 等）。

### 一般般，看不懂就跳过

1.  如果是report （实验报告）或book （计划书等）的 chapter 的tex 源文件放在inc 文件夹下，用`\include` 包含。方便用 `\includeonlonly` 调试。如果是 article（论文）或beamer （幻灯片）没这个必要， 直接写在tex主文件里。
2.  包含了ctan 中没有的宏包注明，自己临时写的（只打算用这一次以后不会再用的）sty 或cls 文件放到工作文件夹，从github、texstudio 下的可以放到“texlive\texmf-local\tex\latex\local”，然后Refresh FNDB（filenamedatebase）。但 *不建议自己写宏包，除非你真的清楚自己在做什么。*
3.  如果有配置文件如.latexmkrc ，放在工作文件夹下就可以了。

其它
----

1.  插入大量相关联的文件时，统一命名。例如 2-3-5a1.png 到 2-3-5a8.png 指的是插入到第2章第3节第5子节的8个 `\begin{subfigure}` 中。
2.  文件命名用英文。虽然tex 支持utf-8 的中文，但大多数人的windows 的字符编码都是cp936。文件名避免\_和\^。如果有请把 `\include{...}` 改为`\include{\string"...\string"}` 。
3.  善于使用反向搜索。
4.  建议使用一个好的编辑器。VSCode的latexworkshop 就很适合新手。熟练之后考虑Vimtex 或Emacs。
5.  善于使用代码补全。可以少打很多字。[SirVer/ultisnipsText]
6.  推荐使用git 做版本控制。
7.  建议更新到Tex Live 2019。
8.  pdf 为什么比 word 好？

> docx 是一个压缩包，用解压缩软件解压能看到，本质仍是文字，如果电脑缺少字体就不能正确显示；pdf 是矢量图。图片显示与字体无关。几乎所有电脑上都有网页浏览器打开pdf；

> docx 需要另外安装软件。且只能在相同版本下阅读，比如Word2003不能打开Word2010。Word必须在相应版本的Office上运行，如果使用其它软件会变形或者错误，尤其是WPS打开也会比较勉强；

Dependent
---------

1.  A LaTex distribution. Such as [texlive].

Install
-------

``` {.zsh}
git clone git@github.com:Freed-Wu/2019cumcm1
cd 2019cumcm1
latexmk -pvc main.tex
```

Q & A
-----

More question see [Issues].

If you don't wanna compile, you can download the complied paper from
[Release]

  [texlive]: https://github.com/TeX-Live/texlive-source
  [Issues]: https://github.com/Freed-Wu/2019cumcm1/issues
  [Release]: https://github.com/Freed-Wu/2019cumcm1/releases/
  [中文文案排版指北（简体中文版）]: https://github.com/mzlogin/chinese-copywriting-guidelines
  [知乎]: https://www.zhihu.com/question/27589739
  [公式查看]: http://latex.91maths.com/
  [表格转换]: http://www.url.com
  [SirVer/ultisnipsText]: https://github.com/SirVer/ultisnips
