
<h1 class="title toc-ignore">Inference of Fuzzy Cognitive Maps (FCMs)</h1>
<h4 class="author"><em>Zoumpoulia Dikopoulou, Elpiniki Papageorgiou</em></h4>
<h4 class="date"><em>2017-07-10</em></h4>



<p><br></p>
<div id="the-fcm-package" class="section level3">
<h3>The fcm package</h3>
<p>Estimates the Inference of a Fuzzy Cognitive Map. Moreover, the “<strong>fcm</strong>” package provides a selection of <strong>3 different inference rules</strong> and <strong>4 threshold functions</strong> in order to obtain the FCM inference. It returns a dataframe of the concepts’ values of each state after the inference procedure. FCM is proven to be capable of causal inference and is applicable to modeling complex decision problems where numerous interlinked dependent variables influence one another.</p>
<p><br></p>
<div id="fuzzy-cognitive-maps-fcms" class="section level4">
<h4>Fuzzy Cognitive Maps (FCMs)</h4>
<p>Fuzzy Cognitive Map is a combination of fuzzy logic and cognitive mapping, and it is a way to represent knowledge of systems which are characterized of uncertainty and complex processes. FCMs were introduced by Kosko and since then they have gradually emerged as a powerful paradigm for knowledge representation. FCMs are ideal causal cognition tools for modeling and simulating dynamic systems.</p>


FCMs are fuzzy signed directed graphs with feedback. Each interconnection between two concepts Ci and Cj has a weight, a directed edge wij, which indicates the strength of the causal relationships between concepts Ci and Cj. The value of the weight wij indicates how strongly the concept Ci influences concept Cj.The time varying concept function Ci(t) measures the non negative occurrence of some fuzzy event. There are three possible types of causal relationship between concept Ci and concept Cj, according to the sign of the weight wij:   
	wij>0 indicates a positive causality between concept Ci and concept Cj. This means that an increase/decrease in the value of concept Ci leads to the increase/decrease of the value of concept Cj. (positive causality)
	wij<0indicates a negative (inverse) causality between concept Ci and concept Cj. This means that an increase in the value of concept Ci leads to a decrease of the value of concept Cj and a decrease of the value of concept Ci leads to an increase of the value of concept Cj. ( negative causality)
	wij=0 indicates no relationship between concept Ci and Cj. (zero causality)
<h4>Inference Rules</h4>
Every concept in the FCM graph has a value Ai that expresses the quantity of its corresponding physical value and it is derived by the transformation of the fuzzy values assigned by the experts to numerical values. The value Ai of each concept Ci is calculated during each simulation step, computing the influence of other concepts to the specific concept by selecting one of the following equations (inference rules):
<table>
<colgroup>
<col width="25%"></col>
<col width="74%"></col>
</colgroup>
<thead>
<tr class="header">
<th><strong>Inference Rule</strong></th>
<th align="center"><strong>Equation</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Kosko’s inference:</td>
<td align="center"><span class="math inline">\Ai(k+1)=f(∑Nj=1,j≠1wji×Aj(k))</span></td>
</tr>
<tr class="even">
<td>modified Kosko’s inference:</td>
<td align="center"><span class="math inline">\(A_{i}(k+1)=f\left(A_{i}(k)+\sum_{j=1,j\neq1}^Nw_{ji}\times A_{j}(k)\right)\)</span></td>
</tr>
<tr class="odd">
<td>Rescale inference:</td>
<td align="center"><span class="math inline">\(A_{i}(k+1)=f\left((2\times A_{i}(k)-1)+\sum_{j=1,j\neq1}^Nw_{ji}\times (2\times A_{j}(k)-1)\right)\)</span></td>
</tr>
<tr class="even">
<td></td>
<td align="center"></td>
</tr>
</tbody>
</table>
<p>where <span class="math inline">\(A_{i}(k+1)\)</span> is the value of concept <span class="math inline">\(C_{i}\)</span> at simulation step <span class="math inline">\(k+1\)</span>, <span class="math inline">\(A_{j}(k)\)</span> is the value of concept <span class="math inline">\(C_{j}\)</span> at the simulation step <span class="math inline">\(k\)</span>, <span class="math inline">\(w_{ij}\)</span> is the weight of the interconnection between concept <span class="math inline">\(C_{j}\)</span> and concept <span class="math inline">\(C_{i}\)</span>, <span class="math inline">\(k\)</span> is the interaction index an every simulation step and <span class="math inline">\(f(·)\)</span> is the threshold (activation) function:</p>
<table>
<colgroup>
<col width="21%"></col>
<col width="78%"></col>
</colgroup>
<thead>
<tr class="header">
<th><strong>Threshold function</strong></th>
<th align="center"><strong>Equation</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Bivalent:</td>
<td align="center"><span class="math display">\[f(x)= \left\{\begin{array}{ll} 1 &amp; x &gt; 0 \\0 &amp; x\leq 0 \\\end{array} \right.\]</span></td>
</tr>
<tr class="even">
<td>Trivalent:</td>
<td align="center"><span class="math display">\[f(x)= \left\{\begin{array}{ll} 1 &amp; x &gt; 0 \\0 &amp; x=0 \\-1 &amp; x&lt;0 \\\end{array} \right.\]</span></td>
</tr>
<tr class="odd">
<td>Sigmoid:</td>
<td align="center"><span class="math inline">\(f(x)=\frac{1}{1+e^{-\lambda\times x}}\)</span></td>
</tr>
<tr class="even">
<td>Hyperbolic tangent:</td>
<td align="center"><span class="math inline">\(f(x)=\tanh(\lambda\times x)\)</span></td>
</tr>
<tr class="odd">
<td></td>
<td align="center"></td>
</tr>
</tbody>
</table>
<p>where <span class="math inline">\(\lambda\)</span> is a real positive number (<span class="math inline">\(\lambda&gt;0\)</span>) which determines the steepness of the continuous function <span class="math inline">\(f\)</span> and <span class="math inline">\(x\)</span> is the value <span class="math inline">\(A_{i}(k)\)</span> on the equilibrium point. The sigmoid threshold function ensures that the calculated value of each concept will belong to the interval [0,1]. When the values of concepts can be negative and their values belong to the interval [-1,1], the following function is used: <span class="math inline">\(f(x)=tanh(x)\)</span>. The FCM model of the system takes the initial values of concepts and weights based on experts knowledge and experience for the real system and then it is free to interact. At each step, the value <span class="math inline">\(A_{i}\)</span> of a concept is influenced by the values of concepts connected to it and it is updated according to the inference rule.</p>
<p><br></p>
<blockquote>
<p><strong>NOTE</strong>: Except the inference rules that mentioned above, the clamping types of these rules are determined (Kosko-clamped, modified Kosko-clamped and Rescale-clamped). In this case, the activated concepts (concept’s value equals to 1) are activated in all states in the FCM simulation until the output is stabilized.</p>
</blockquote>
<p><br><br></p>
</div>
</div>
<div id="how-is-it-possible-to-obtain-the-fcm-inference-using-r" class="section level2">
<h2>How is it possible to obtain the FCM inference using R?</h2>
<div id="step-1-load-the-fcm-package" class="section level3">
<h3>Step 1: Load the fcm package</h3>
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class="kw">library</span>(fcm)</code></pre></div>
<p><br><br></p>
</div>
<div id="step-2-create-or-import-the-weight-matrix-and-the-activation-vector" class="section level3">
<h3>Step 2: Create (or import) the weight matrix and the activation vector</h3>
<p>The <strong>weight matrix</strong> stores the weights assigned to the pairs of concepts which are usually normalized to the interval <span class="math inline">\([0, 1]\)</span> or <span class="math inline">\([-1, +1]\)</span>. The dimension of the weight matrix is <em>m x m</em>, where m denotes the number of the columns (nodes).</p>
<p>The <strong>activation vector</strong> contains the initial concept values which each concept is turned on or activated by making its vector element 1 or 0 or in <span class="math inline">\([0, 1]\)</span>. The dimension of the activation matrix is <em>1 x m</em>.</p>
<blockquote>
<p><strong>NOTE</strong>: Both of these input arguments should be transformed as <strong>dataframes</strong>.</p>
</blockquote>
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r">act.vec &lt;-<span class="st"> </span><span class="kw">data.frame</span>(<span class="dv">1</span>, <span class="dv">1</span>, <span class="dv">1</span>, <span class="dv">0</span>, <span class="dv">0</span>, <span class="dv">0</span>)    <span class="co"># Create the activation vector</span>
<span class="kw">colnames</span>(act.vec) &lt;-<span class="st"> </span><span class="kw">c</span>(<span class="st">&quot;C1&quot;</span>, <span class="st">&quot;C2&quot;</span>, <span class="st">&quot;C3&quot;</span>, <span class="st">&quot;C4&quot;</span>, <span class="st">&quot;C5&quot;</span>, <span class="st">&quot;C6&quot;</span>)  <span class="co"># Change the column names</span>

C1 =<span class="st"> </span><span class="kw">c</span>(<span class="fl">0.0</span>, <span class="fl">0.0</span>, <span class="fl">0.6</span>, <span class="fl">0.9</span>, <span class="fl">0.0</span>, <span class="fl">0.0</span>)
C2 =<span class="st"> </span><span class="kw">c</span>(<span class="fl">0.1</span>, <span class="fl">0.0</span>, <span class="fl">0.0</span>, <span class="fl">0.0</span>, <span class="fl">0.0</span>, <span class="fl">0.0</span>)
C3 =<span class="st"> </span><span class="kw">c</span>(<span class="fl">0.0</span>, <span class="fl">0.7</span>, <span class="fl">0.0</span>, <span class="fl">0.0</span>, <span class="fl">0.9</span>, <span class="fl">0.0</span>)
C4 =<span class="st"> </span><span class="kw">c</span>(<span class="fl">0.0</span>, <span class="fl">0.0</span>, <span class="fl">0.0</span>, <span class="fl">0.0</span>, <span class="fl">0.0</span>, <span class="fl">0.9</span>)
C5 =<span class="st"> </span><span class="kw">c</span>(<span class="fl">0.0</span>, <span class="fl">0.0</span>, <span class="fl">0.0</span>, <span class="fl">0.0</span>, <span class="fl">0.0</span>, -<span class="fl">0.9</span>)
C6 =<span class="st"> </span><span class="kw">c</span>(-<span class="fl">0.3</span>, <span class="fl">0.0</span>, <span class="fl">0.0</span>, <span class="fl">0.0</span>, <span class="fl">0.0</span>, <span class="fl">0.0</span>)


w.mat &lt;-<span class="st"> </span><span class="kw">matrix</span>(<span class="kw">c</span>(C1, C2, C3, C4, C5, C6), <span class="dt">nrow =</span><span class="dv">6</span>, <span class="dt">ncol=</span><span class="dv">6</span>, <span class="dt">byrow=</span><span class="ot">TRUE</span>)   <span class="co"># Create the weight matrix</span>
w.mat &lt;-<span class="st"> </span><span class="kw">as.data.frame</span>(w.mat)    <span class="co"># Transform w.mat as a dataframe</span>
<span class="kw">colnames</span>(w.mat) &lt;-<span class="st"> </span><span class="kw">c</span>(<span class="st">&quot;C1&quot;</span>, <span class="st">&quot;C2&quot;</span>, <span class="st">&quot;C3&quot;</span>, <span class="st">&quot;C4&quot;</span>, <span class="st">&quot;C5&quot;</span>, <span class="st">&quot;C6&quot;</span>) 
w.mat       <span class="co"># View the weight matrix</span></code></pre></div>
<pre><code>##     C1  C2  C3  C4  C5   C6
## 1  0.0 0.0 0.6 0.9 0.0  0.0
## 2  0.1 0.0 0.0 0.0 0.0  0.0
## 3  0.0 0.7 0.0 0.0 0.9  0.0
## 4  0.0 0.0 0.0 0.0 0.0  0.9
## 5  0.0 0.0 0.0 0.0 0.0 -0.9
## 6 -0.3 0.0 0.0 0.0 0.0  0.0</code></pre>
<blockquote>
<p><strong>NOTE</strong>: It is possible to import a file (for instance a .csv file), typing the file path. <br> <code>w.mat &lt;- read.csv(&quot;C://type_the_file_path//name_of_file.csv&quot;)</code> <br></p>
<p><em>For more information about reading <strong>.csv</strong> files, type in R console:</em> <code>?read.csv</code>.</p>
</blockquote>
<p><br><br></p>
</div>
<div id="step-3-use-the-fcm.infer-function" class="section level3">
<h3>Step 3: Use the fcm.infer function</h3>
<p>There are seven input arguments in the <code>fcm.infer</code> function:</p>
<table>
<colgroup>
<col width="17%"></col>
<col width="82%"></col>
</colgroup>
<thead>
<tr class="header">
<th><strong>Arguments</strong></th>
<th><strong>Explanation</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>activation_vec</strong></td>
<td>The activation vector contains the initial concept values which each concept is turned on or activated by making its vector element 1 or 0 or in <span class="math inline">\([0,1]\)</span></td>
</tr>
<tr class="even">
<td><strong>weight_mat</strong></td>
<td>The weight matrix stores the weights assigned to the pairs of concepts which are usually normalized to the interval <span class="math inline">\([0, 1]\)</span> or <span class="math inline">\([-1, +1]\)</span></td>
</tr>
<tr class="odd">
<td><strong>iter</strong></td>
<td>The number of iterations is a positive number (<span class="math inline">\(iter &gt; 0\)</span>). <em>Default value: <span class="math inline">\(iter = 20\)</span></em></td>
</tr>
<tr class="even">
<td><strong>infer</strong></td>
<td>Six different inference rules are available (Kosko: <code>'k'</code>, modified Kosko: <code>'mk'</code>, Rescale: <code>'r'</code>, Kosko-clamped: <code>'kc'</code>, modified Kosko-clamped: <code>'mkc'</code> or Rescale-clamped: <code>'rc'</code>). <em>Default value: <code>infer = 'k'</code> </em></td>
</tr>
<tr class="odd">
<td><strong>transform</strong></td>
<td>Four transformation functions (Bivalent: <code>'b'</code>, Trivalent: <code>'tr'</code>, Sigmoid: <code>'s'</code> or Hyperbolic tangent: <code>'t'</code>). <em>Default value: transform = <code>'s'</code></em></td>
</tr>
<tr class="even">
<td><strong>lambda</strong></td>
<td>The lambda (<span class="math inline">\(\lambda\)</span>) parameter is a positive number, higher than zero and lower-equal to ten, <span class="math inline">\(0&lt;\lambda\leq10\)</span>. <em>Default value: <span class="math inline">\(lambda = 1\)</span> </em></td>
</tr>
<tr class="odd">
<td><strong>e</strong></td>
<td>Epsilon (<span class="math inline">\(\epsilon\)</span>) is a residual, describing the minimum error difference among the subsequent concepts. Its value depends on the application type. The possible <span class="math inline">\(e\)</span> value is determined between <code>0.01</code> and <code>0.000001</code>. <em>Default value: <span class="math inline">\(e = 0.001\)</span></em></td>
</tr>
<tr class="even">
<td></td>
<td></td>
</tr>
</tbody>
</table>
<p><br></p>
<p>The <code>fcm.infer</code> function prints a message to inform the user if the convergence has been reached or not.</p>
<ul>
<li>If the convergence has been reached then the converged state (fixed point) is printed:</li>
</ul>
<p><em><code>&quot;The concepts' values are converged in the ith state&quot;</code></em>.</p>
<p><br></p>
<ul>
<li>If the convergence has not been reached a message informs the user that more iterations required:</li>
</ul>
<p><em><code>&quot;More iterations are required to reach the convergence&quot;</code></em>.</p>
<p><br><br></p>
<div id="examples-to-obtain-the-fcm-inference" class="section level4">
<h4>Examples to obtain the FCM Inference</h4>
<p><strong>Example 1: Estimate the FCM Inference (using the default values of the function)</strong></p>
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r">output1 &lt;-<span class="st"> </span><span class="kw">fcm.infer</span>(act.vec, w.mat)</code></pre></div>
<pre><code>## 
##  The concepts' values are converged in the 6th state (e &lt;= 0.001000) 
## 
##         C1        C2        C3        C4        C5        C6
##  0.4778365 0.5986462 0.5712033 0.6059079 0.6257586 0.4955168</code></pre>
<p><br></p>
<p><strong>Example 2: Estimate the FCM Inference (changing the default values)</strong></p>
<p>The FCM Inference (fcm.infer) function is using the rescale <code>'r'</code> inference rule, the sigmoid <code>'s'</code> transformation function, the lambda parameter equals to 2 <code>lambda = 2</code> and the e parameter <code>e = 0.0001</code>.</p>
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r">output2 &lt;-<span class="st"> </span><span class="kw">fcm.infer</span>(act.vec, w.mat, <span class="dv">35</span>, <span class="st">&quot;r&quot;</span>, <span class="st">&quot;s&quot;</span>, <span class="dt">lambda =</span> <span class="dv">2</span>, <span class="dt">e =</span> <span class="fl">0.0001</span>)</code></pre></div>
<pre><code>## 
##  The concepts' values are converged in the 30th state (e &lt;= 0.000100) 
## 
##         C1        C2        C3        C4        C5        C6
##  0.8654104 0.9534946 0.9309104 0.9589686 0.9684847 0.3186077</code></pre>
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r">output2$values          <span class="co"># View the concepts' values for each iteration</span></code></pre></div>
<pre><code>##           C1        C2        C3        C4        C5        C6
## 1  1.0000000 1.0000000 1.0000000 0.0000000 0.0000000 0.0000000
## 2  0.9426758 0.9677045 0.9608343 0.4501660 0.4501660 0.1192029
## 3  0.9179445 0.9593460 0.9481304 0.8012773 0.8114818 0.1789925
## 4  0.9038475 0.9565677 0.9424370 0.9375972 0.9457921 0.2106909
## 5  0.8952183 0.9554297 0.9392881 0.9609935 0.9669441 0.2338428
## 6  0.8891841 0.9548570 0.9373607 0.9632707 0.9692077 0.2523626
## 7  0.8845094 0.9545244 0.9360451 0.9628218 0.9692708 0.2666038
## 8  0.8807890 0.9543063 0.9350512 0.9621493 0.9691369 0.2775191
## 9  0.8778103 0.9541466 0.9342632 0.9615592 0.9690137 0.2859616
## 10 0.8754189 0.9540220 0.9336277 0.9610727 0.9689135 0.2925587
## 11 0.8734943 0.9539220 0.9331126 0.9606759 0.9688324 0.2977590
## 12 0.8719415 0.9538409 0.9326946 0.9603529 0.9687666 0.3018871
## 13 0.8706860 0.9537751 0.9323549 0.9600900 0.9687130 0.3051822
## 14 0.8696690 0.9537215 0.9320786 0.9598760 0.9686694 0.3078236
## 15 0.8688440 0.9536779 0.9318538 0.9597017 0.9686340 0.3099481
## 16 0.8681740 0.9536423 0.9316707 0.9595596 0.9686050 0.3116613
## 17 0.8676294 0.9536134 0.9315216 0.9594438 0.9685815 0.3130458
## 18 0.8671865 0.9535898 0.9314000 0.9593494 0.9685623 0.3141663
## 19 0.8668261 0.9535705 0.9313010 0.9592724 0.9685466 0.3150745
## 20 0.8665327 0.9535549 0.9312203 0.9592096 0.9685338 0.3158112
## 21 0.8662938 0.9535421 0.9311544 0.9591584 0.9685234 0.3164094
## 22 0.8660993 0.9535316 0.9311008 0.9591167 0.9685149 0.3168954
## 23 0.8659408 0.9535231 0.9310571 0.9590827 0.9685080 0.3172905
## 24 0.8658118 0.9535162 0.9310214 0.9590550 0.9685023 0.3176117
## 25 0.8657066 0.9535105 0.9309924 0.9590324 0.9684977 0.3178731
## 26 0.8656210 0.9535059 0.9309687 0.9590139 0.9684940 0.3180857
## 27 0.8655513 0.9535022 0.9309494 0.9589989 0.9684909 0.3182588
## 28 0.8654944 0.9534991 0.9309337 0.9589867 0.9684884 0.3183997
## 29 0.8654481 0.9534966 0.9309208 0.9589767 0.9684864 0.3185144
## 30 0.8654104 0.9534946 0.9309104 0.9589686 0.9684847 0.3186077
## 31 0.8653797 0.9534929 0.9309019 0.9589620 0.9684834 0.3186838
## 32 0.8653547 0.9534916 0.9308950 0.9589566 0.9684823 0.3187457
## 33 0.8653343 0.9534905 0.9308893 0.9589522 0.9684814 0.3187961
## 34 0.8653177 0.9534896 0.9308847 0.9589486 0.9684807 0.3188372
## 35 0.8653042 0.9534888 0.9308810 0.9589457 0.9684801 0.3188707</code></pre>
<p><br><br></p>
</div>
</div>
<div id="step-4-visualize-the-concepts-values-for-each-iteration" class="section level3">
<h3>Step 4: Visualize the concepts’ values for each iteration</h3>
<p>For the visualization of the concepts’ values for each iteration after the inference process, it is crucial to load the libraries: <code>reshape</code> and <code>ggplot2</code>.</p>
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class="co"># load the libraries</span>
<span class="kw">library</span> (reshape2)
<span class="kw">library</span> (ggplot2)</code></pre></div>
<p><br></p>
<p><strong>Visualization of Example 1:</strong></p>
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r">iterations &lt;-<span class="st"> </span><span class="kw">as.numeric</span>(<span class="kw">rownames</span>(output1$values))  <span class="co"># create a numeric vector named &quot;iterations&quot;</span>
df &lt;-<span class="st"> </span><span class="kw">data.frame</span>(iterations, output1$values)   <span class="co"># add &quot;iterations&quot; in the &quot;output1$values&quot; dataframe</span>
df2 &lt;-<span class="st"> </span><span class="kw">melt</span>(df, <span class="dt">id=</span><span class="st">&quot;iterations&quot;</span>)              <span class="co"># transform the dataframe df into long formats</span>
<span class="kw">ggplot</span>(<span class="dt">data=</span>df2,                              <span class="co"># Visualize the concepts' values </span>
       <span class="kw">aes</span>(<span class="dt">x=</span>iterations, <span class="dt">y=</span>value, <span class="dt">group=</span>variable, <span class="dt">colour=</span>variable)) +
<span class="st">       </span><span class="kw">theme_bw</span>() +<span class="st"> </span><span class="kw">geom_line</span>(<span class="dt">size=</span><span class="fl">0.7</span>) +<span class="st"> </span><span class="kw">geom_point</span>(<span class="dt">size =</span> <span class="dv">3</span>)</code></pre></div>
<p><img src="data:image/png;base64,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" /><!-- --></p>
<p><br><br></p>
<p><strong>Visualization of Example 2:</strong></p>
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r">iterations &lt;-<span class="st"> </span><span class="kw">as.numeric</span>(<span class="kw">rownames</span>(output2$values))  
df &lt;-<span class="st"> </span><span class="kw">data.frame</span>(iterations, output2$values)   
df2 &lt;-<span class="st"> </span><span class="kw">melt</span>(df, <span class="dt">id=</span><span class="st">&quot;iterations&quot;</span>)              
<span class="kw">ggplot</span>(<span class="dt">data=</span>df2,
       <span class="kw">aes</span>(<span class="dt">x=</span>iterations, <span class="dt">y=</span>value, <span class="dt">group=</span>variable, <span class="dt">colour=</span>variable)) +
<span class="st">       </span><span class="kw">theme_bw</span>() +<span class="st"> </span><span class="kw">geom_line</span>(<span class="dt">size=</span><span class="fl">0.7</span>) +<span class="st"> </span><span class="kw">geom_point</span>(<span class="dt">size =</span> <span class="dv">3</span>)</code></pre></div>
<p><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAqAAAAGACAMAAABFpiBcAAAA51BMVEUAAAAAADoAAGYAOpAAZrYAujgAv8QzMzM6AAA6ADo6AGY6OmY6OpA6kNtNTU1NTW5NTY5NbqtNjshhnP9mAABmADpmAGZmOgBmOpBmtv9uTU1uTW5uTY5ubqtuq+SOTU2OTW6OTY6OyP+QOgCQOjqQOmaQZgCQkDqQkGaQtpCQ27aQ29uQ2/+rbk2rbm6rbo6ryKur5P+2ZgC225C22/+2//+3nwDIjk3I///bkDrb/7bb/9vb///kq27k///r6+v1ZOP4dm3/tmb/yI7/25D/27b/29v/5Kv//7b//8j//9v//+T///91AeI/AAAACXBIWXMAAA7DAAAOwwHHb6hkAAAYTklEQVR4nO2dC1vcOJqFK50UnWSHSkgxu0t3QhIyOzM9Q7oHdsNlN9AUMFMU+P//nrV8lco3ybb06bPOeRLKsovDofQiS/JtFkGQx5pRB4CgNgFQyGsBUMhrAVDIawFQyGsBUMhr9Qf0RwiSNCKUsgYAWiz9PkaQkVwQxrJNkwsAdWqDMKYuANSpDcKYugBQpzYIY+oCQJ3aIIypCwB1aoMwpi4A1KkNwpi6AFCnNghj6gJAndogjKkLAHVqgzCmLmwAnc/n/fxYVAOJDYswNICu318kr5uPi73r4mU7kZR5nqpPEhbVQGLDIgwJoHeLtwmgT1+Poqt3+UslEQC1a8MiDAWg52/+kbagm88XojHNXiqJyszzeX9CWVQDiQ2LMKS7+PWH62jz6SR7ibJT7X6vqgC0Zhs0aZECereXkJm9ZNvQgrqyYRHGrxZUTYQ+qF0bFmFIAdXug0ZoQS3YsAhDCujT18N0FH/YNYpP50FX0fzMOAmLaiCxYRGGDlDxX3seNFMfQhWX5XLZq9T7G8cpbQuADpalQ52CUIHo2ZkuqHJNL1MZl3p/4zglz/5aHISRxAxQQaigM5GG2UiE0AIaWhhF3ADNCI17pBKgzbAqv/lyKRf1S72/cZwSALUhi4BGZ9mQPqNyuz2VlqWaXvJU5Nlfi4MwTTiMK3un263aAVVKbTVNXA2apWVQasVhXFk8H3RVHFc6U5RurQc0inZiZYWdVE2l+PuKUmqjFl2XtqpPLdKW0ILWSj3weZb1SM/y4X38i2aELtuwayxV4dUk201pymFacRhXTgBNCJV2+GcpnkIpp8VvnsKbfBI7O2nz2lbayUp5C6oUnZfU6qNtzh2EUcUR0PLIfP6lPApaACp2FzsSdgLe7O816wXol3p/41il9JeoLdKWRjZtxWFcuQE02m5O1V5nursuGsK05s+yDmprKSckqinSlqYfRhVHQFcrMU6KvyaluYJoAWhK5Xwe/97FOSbqGSdqSZ1bzXCNaou0pemHUcQU0FRJScIz/lIAmpC3dR5pG6Btpd7fuE39GCUrpl6FUcQfUJUJqb89VxRt42oAb29AbZSmH0YRR0AjPUAjBcJ5i6JtXNVS60adb4zGLAHQUeQC0EhCNN+0o04Q1eFSZWluQ20/cEDJiqlXYVSxBDRBNH1VSkLZgDArqb94S2n8aphDxmrFYVy5uvVN0o5K+/stQJXW1fmOTP3gxymhBR1H7u7NpHZIxfHNHeWIRMsNdOaa8E6/2+dVGEXTATQjtHK8TPuKhHkjvB0bm0tsmPAqjKIJAir3SLVdOtXTph/YVv5aGIWRNCFAV3Kx3M7i0jASGxZh+ANaIim+LAGoYxcA2qWa9lMidGuH31sBMUFiM2FAFQi3AK20p70VEBMkNpMGtNRypbah24D2hzUgJkhsQgF0p0RytQXrMFwDYoLEJkBAo44dvhmuATFBYhMGoMksfV2PVJWyMaorVXENiAkSm4AAlVXfnqo9gJp3VgdXKq+9u7IsmCCxAaAKkpUWtb23atLYtqLMggkSmyAArbtudYukXri2AqpfMkG5FfPeDbgqANpLIwMqu7TQ04hrldfWxtZ+yRL1I/21jGRaykNAez8QYvn7Ttdb4s9BXl6VZaVUMCgv12jrre2lth9oUBrJxuMwijwEtFgybUFrG1Cd8/Kz5dWqvQmrtqArbbW5GJWoG3C1ZMdUVtCAqlo14qrZN2grrWxI/8dbKtkxVTQhQOv57NuHVz4u9fPrWRqfidXUVFMPAFRP6qcnl9TP1n7JBvV9S2hBTWQVUN2urH2UiXudDsIomg6gDXx6Nduni7LBzA4A7ScAatFFtRmH+lH+WkYzLQVANeUvoMQuOJKkpyY+eVQDiQ2LMABUUwExQWIDQAcqICZIbKYOaCOfPKqBxIZFGACqqYCYILEBoAMVEBMkNpMGtOERO4Yu7QqICRKbCQNaPHemXiyqgcSGRRgAqqmAmCCxmS6g0qO7asWiGkhsWIQBoJoKiAkSGwA6UAExQWIzXUDbHpWr79KpgJggsQGgAxUQEyQ2EwZUfXRXRSyqgcSGRRj+gFaejLQlFtVAYsMiDADVVEBMkNhMGNAE0eaNLKqBxIZFmEkA2ngUycilXQExQWIDQAcqICZIbADoQAXEBIkNAB2ogJggsZkyoC0ngxq4dCggJkhsAOhABcQEiQ0AHaiAmCCxmTSgrVtZVAOJDYswFIBuPi72rsXC1ULoKHl9e1FJBEDt2rAIQwDo09cYyXd56S5m9fyoNhEAtWvDIgwBoJvPF9H6fdZgbj6dRE+/ntQmAqB2bViEIQB0/eE64TKRaErjXb7Y0Ys0QnXPemjV0vg7IDYyAPT+1fH2orRKH1CxU88BTV7XP8utqPlVna2DeB7tBIkNizD9WtBBgMot6F06WopV9EMBqCsbFmEIAJX7oOeH+VoA6tyGRZh6QB+/7MZfL3/4dv9yNpvtRvev/zL74b9jGvPyq7/OZs+/J4A+fpnNfvi27dA6ij/MR/Hpjl00o0+/9Z5mah8j8agGEhsWYRpa0MuYvpjSh/2DjNMXSXNZlp9/f/zyQqwSL8nbVXXPg4pGNNvTXy0Wb4qBPAB1ZcMiTAOgommM///re7p8//IgqivH/25F65mAq8jlrW/aN7OoBhIbFmEaABX7+KRZvI136c+Ok75m8iUrv06pjFddzhLtbhkAUIsuIYVpGiTdPv+/mNGH/WfHWUuZ7eKzsgRoZe+eCIBadAkpTBOgD3/8JYbwNmlEyxZ0uyxWxcjWyOGtb9oH8TyqgcSGRZjGaabT2YuExXjgLgGal+VBUgxtlVIAatElpDCNgN7OxLjnNO5x/i3Zlad90KL819ksHdgn00zVVtQhoB3bWVQDiQ2LMPzPBwWgtC4AtEMAlNYFgHYIgNK6ANAOAVBaFwDaIQBK6wJA29U1y8SjGkhsWIQBoJoKiAkSm+kC2vUGFtVAYsMiDADVVEBMkNgA0IEKiAkSGwA6UAExQWIDQAcqICZIbHoDulqt+vw8AGrRJaQwHYCuUinrxEn16VnKyXnL9XIFaOcsE49qILFhEcYc0EtxEdJpejlI9WrOXADUoktIYdoBXa0qhD788TgS1ywdRKfPfvGgBe18B4tqILFhEaYR0FVF6fpb6RokH3bxne9gUQ0kNizCGLegty/KZQBK4xJSGOM+6P0f0IJSu4QUxhjQsg8KQKlcQgpjPg9ajuIBKJFLSGF6HEnyaR60e5aJRzWQ2LAIw/xQZ3cDyqMaSGxYhAGgmgqICRIbADpQATFBYgNAByogJkhsGAFq8gwIPOBj6vIQ0GIJLahdGxZheAOqMcvEoxpIbFiEAaCaCogJEpuJAqrhx6IaSGxYhAGgmgqICRIbADpQATFBYgNAByogJkhsAOhABcQEiU1vQM/Ozvr8PABq0SWkMB2AnqVS1uWn24nndm4/YK6QE0B1Zpl4VAOJDYsw5oDmJyyLU+t7Pe24QyaA6vixqAYSGxZh2gE9O6sQWlzykVw9d9rUhAJQiy4hhWkE9KyidL182XFGa50AqEWXkMIYt6DyZcfpY+VrBUAtuoQUxrgPKl12/LDfyCcAtekSUhhjQMvLjpOHxjcJgFp0CSmM+TxoPopv5ROA2nQJKUz/y44vZ0KUo3itaVAe1UBiwyIM50OdWg0oj2ogsWERBoBqKiAmSGwA6EAFxASJDS2gcX/14FKe4W8RAHVlwyKME0BPn//v/sHjlxdNb1YEQF3ZsAjjAtCH/YP4X3TbfEf7+kQA1K4NizAAVFMBMUFiQ7qLvxS7+LYDo7K0AdWbBuVRDSQ2LMK4GSSJuf2ZHp8GgOr5sagGEhsWYRhPMwFQL1wAaJMAqBcuEwD0YT85bN/yXLr6RADUrg2LMO5a0Oaz71UBUFc2LMJ0Ajqfz/v8vJpd/K3eoSQA6sqGRZgOQOeplHX5Zce3bTvtOkCxi0cYYxdzQIsTll9/iy4bj17WAHo6bguqySePaiCxYRGmHdD5vEKo/KS5lgcl1QySnh1n5c3Hxd51snS1WCzeXkgrIgDqzoZFmEZA5xWl65WepFELmuvp61F09S5ZPD/aWhEBUHc2LMIYt6DSZcf3L4tGsaIWQDefL6L1+4t46enXE3WFmgiA2rVhEca4Dyo/7Vjnxg35JGg5D7r+cB1tPgk04137YnEkrfhRSPPxD3jARxAyBlTpg/a69c3dXs7j+ucT0YqWK4TQgrqyYRHGfB40H8WLzmivW9+UDWai8yN1BQB1ZcMizICnHV9KA/OKFEDFjRrLXbza5YwBRR+UxoZFGBeHOh+/7MZdAnHOcqKnr4fZoF3s259+uyhXqIlaf3NdPnlUA4kNizCOzqiPTnfLCap02lO0mVeLxZuTqNc8KAD1xGUigF6+GPlQJwD1xGUCgEanCZ2a1x0DUFc2LMI4AVTcR/S0ZUSlCIC6smERhu0Z9QDUExcAWi8A6onLBADVveA4lRagyyUA9cRlAoAmtxJtu9utIg1Al6n0/FhUA4kNizCudvGnbYedFAFQVzYswjjsg56ONQ+6XJoQyqIaSGxYhHHYgurxCUCd2bAI42aiXnv/HgFQdzYswnQCurOjd4+uLW0f6tQX+qCubFiE6QB0J5WyLj/drjxtuUZW50EBqEcu3gGan7AsFskex415UG9cSAHd2akQKl3ycf9v/0EGqL4fi2ogsWERphHQnYrS9eVlx49/+jvRLh6AeuTiWwtaXnZ8uUvVBwWgHrn41gctLjuOFwAojUtIYYwBLfqg6bM6m04DAaAWXUIKYz4PKo3i0YLSuIQUZsBlxwCUyiWkMExPWAag3rgA0DoBUG9cAGidAKg3LgC0RgZ88qgGEhsWYQCoUxuEMXUBoE5tEMbUBYA6tUEYUxcA6tQGYUxdAKhTG4QxdQGgTm0QxtTFQ0A17qyPBygEIw8BLZbQgtq1YREGgDq1QRhTl05ADS5Pk2X3qk4TPxbVQGLDIkwHoHUX+EpP+Wi+WwgAtegSUhhzQIsTlhsf4iUEQC26hBSmHdCam8wUl3w8/um45TsBqEWXkMI0ArqsKF1fXHacPIST6M4iJn4sqoHEhkUY4xa0uOz4/tVx1NyKAlCLLiGFMe6DKk877vUw2Q4BUFc2LMIYAzr8accdAqCubFiEMZ8HlZ92/PhfmGYicAkpjJOnHRtJ4wa2Rn4sqoHEhkUYjoc6ASjPMDc3N5olSQDUqc04Lvo1bb+k/dabVBolRQDUqU2LizYT+jVtv2THVBYAdWkzSvvCE9CbG7nYVlIFQO3a9INQo6RR0/ZLum+90VTNBwhAx7a56YOkLhO6Ne2ZDH7DbQHQ4TY3ekg2VoqtmrZf6vHW7s9JFQDtY3NjjORNiyKz9sWnEgZJdaIA9GYgklEHdsRM9GbJBDsVwbaSJIaAGl6CMgagoyA5XvuiX9P2S/2wq2pCR5LcALpNhGUkzSrap6MGONS5LReA1rI0FMkB7cuWAOhgTRPQoUjyYILEpjegPf/MGQIq/aY3DVK2RnWljg+MBRMkNj0B3f70hfLT7R6/0JxuZwfQOgR79R7HCOPGhkUYc0Dly47LB3duizGg1SZzCJK9wrixYRGmHdDtioqkSz4e/r3pbHohFoDW79SlYu1bh4gFEyQ2xoA2dcCKRvP+D3/mvYtv26lX9xwBMUFiM1oLWl52/PJg6xJPWawArdmphzz1SGIzWh9Uftpxtr+vkz1ATe9l1vSbd+3UNW3GCUNiwyKMMaBlH/Q/JwKoUjS2GScMiQ2LMObzoPIonmIXPwjQumFRzbYum95iwQSJzYhHkvJ50If95rsvtgK6+bjYu06W1j8tFkdRdLVYLN5eVBKNDqjS6+xsMxttBogFEyQ2Hh3qfPp6FF29E0ubTyfR+ueT6PyoNpE1QPV6nY02A8SCCRIbjwDdfL6I1u9Fg3knMD0/evr1pDbR2IAa7tSbbIaIBRMkNh4Buv5wnbSdqeKleJef7OnjNEIdj33o/4SPAtDeDpBzEQB6tycB+vT1MNnLl63oyC1o27DIRAE1WiQ2nragm4+H2dqiHzoqoEOGRaoCYoLExiNAyz5oPIovhkd2Ae0zLFIVEBMkNh4BKvbq6Sg+41Ps859+05xm6sNnv2GRqoCYILHxCNBsHjRuRMX8pxgexa9vioG8VUD7KyAmSGx8ArRdANSVDYswkwZ0RD5DYoLEJiBAcyClizB7hykVEBMkNsEAqo7bRzsVPiQmSGxCA7SkkkU1kNiwCDM1QKvdThbVQGLDIgwA1VRATJDYTAVQ3T08AHXlAkAVdQ7iK+N2FtVAYsMizNQArc58sqgGEhsWYaYFaHHekiQW1UBiwyLMpACtnfFkUQ0kNizCTALQ/IzPWj8W1UBiwyLMBADtOODOohpIbFiEmQ6gTX4sqoHEhkUY/oB2nbLEohpIbFiEAaCaCogJEpuJANrSBQWgNC4AVFbdIB59UFIXACoLgI5owyLMFADFgzUoXQCorLo+aIcfi2ogsWERhj2gnRd0sKgGEhsWYQCopgJigsRmqoB2XxHHohpIbFiEYQ6oxhWbLKqBxIZFGN6A6lxRzKIaSGxYhOEFaA8+eVQDiQ2LMABUUwExQWIzRUD1bhnCohpIbFiEYQpocnMbPT8W1UBiwyIMS0CNbgnGohpIbFiE8RDQlkc+ZE/4yAB18pQJiFYeAlosNbWgZrf9ZNFOkNiwCANANRUQEyQ2AHSgAmKCxGYSgOaDeAySPHIBoKUA6Kg2LMKwBDTSx5NJNZDYsAjDFFADPxbVQGLDIgwAdWqDMKYuLAE1em4Hi2ogsWERBoA6tUEYUxeOgJo9+IhFNZDYsAgDQJ3aIIypCwB1aoMwpi6cAO3FJ49qILFhEQaAOrVBGFMXAOrUBmFMXfgBavrwYhbVQGLDIgwAdWqDMKYu7AA1fvo7i2ogsWERBoA6tUEYUxcA6tQGYUxduAFqzCePaiCxYREGgDq1QRhTF0aA9uOTRzWQ2LAIA0Cd2iCMqQsAdWqDMKYuvADtwSePaiCxYREGgDq1QRhTF1aA9uGTRzWQ2LAIA0Cd2iCMqQsAdWqDMKYunADtxSePaiCxYREGgDq1QRhTFzaAmtyOSRGLaiCxYRGGAtDNx8XetbxUrogaADW6n50qFtVAYsMiDAGgT1+Poqt30lK5Qk0EQO3asAhDAOjm80W0fn9RLpUr1ERlZrN7KqtiUQ0kNizCEAC6/nAdbT6dlEvlih+Fah71UADq/CETELEIAL3by3nMlsoVQmhBXdmwCONXC6omQh/Urg2LMDz6oADUhg2LMCSj+MNiFH+YjuIPu0bx6dM5e4lFNZDYsAhDNw8q2kztedABYlENJDYswrA5ktRbLKqBxIZFGADq1AZhTF0AqFMbhDF1AaBObRDG1AWAOrVBGFMXAOrUBmFMXQCoUxuEMXUBoE5tEMbUBYA6tUEYUxcPAYUgSSNCKas/oKVsZeslhGmSV2G0BUBtCmEGC4DaFMIM1hiAQpA1AVDIawFQyGsBUMhrAVDIaw0GVLkMhFjJFX1+BFr/tFgc+RLmbrF4680nY6ihgKq3w6HVnagGPwKJq7PXP5/4EUb83VbuXMRFQwFVL0Um1fmbf4jr+7wIdCdAOD/yI4xQ5apxLhoKqHozB2KJj9+fQJVbXVAqbjr9CWOioYCqt8MhlgDUm0DiLgK+hFn/9ObEmzBmQgtqSZuPhz59Ol415yaaUB80BdSTQOuf4jG8L2GEfOoQm2j4KP7Qn6Gh+Pj9CJTy6UmYbN/uRxhTYR7Uiq4WQkd+hBFp4j6oJ2EMhSNJkNcCoJDXAqCQ1wKgkNcCoJDXAqCQ1wKgkNcCoJDXAqCdun91HP3zfxo2xhvEdsiWAKiOGhkEnLYFQHUEQMkEQDt1/+qXl7PZbvT4ZTb74Vt0//ov8ct9vGq2K77uCkjFthf5Ww/iBbH5gDr5FARAOxUDmDIYE3j5/Pv9y/j1YT+m7zLmNN4Q/xfbxP/7l8+/56vjAggdLgDaqQzQ27j1FGAm3P3re7kh/p9suxXt6kG6+vU36tRTEQDtVMbh5SzRbtbtvI2XnxWAxg1n/r6kX3qa7PGh4QKgncoBFRBG2bjoYf/ZsdyCbgMq3iE6rNBQAdBO5bv4GMmsGLefgsjbsgUV227zvmc2sk/6qdBAAdBOxcAJ1h6/xFBmTCa03r98lmyQB0kZoEmfFFNQYwiAdirtU75IppLSHXu8Mu5kPvtbTGe8QZlmOk6/pD1U2tzTEACFvBYAhbwWAIW8FgCFvBYAhbwWAIW8FgCFvNb/A1HSCADviuLcAAAAAElFTkSuQmCC" /><!-- --></p>
<p><br></p>
</div>
<div id="references" class="section level3">
<h3>References</h3>
<ol style="list-style-type: decimal">
<li>B. Kosko, “Fuzzy cognitive maps”, International Journal of Man-Machine Studies 24, 65-75, 1986.</li>
<li>C.D. Stylios, P.P, Groumpos, “A Soft Computing Approach for Modelling the Supervisor of Manufacturing Systems”, Intelligent and Robotic Systems, VOl. 26, p.p. 389–403, 1999.</li>
<li>E.I. Papageorgiou, “A new methodology for Decisions in Medical Informatics using fuzzy cognitive maps based on fuzzy rule-extraction techniques”, Applied Soft Computing, Vol. 11, Issue 1, p.p. 500–513, 2011.</li>
<li>E.I. Papageorgiou, “Fuzzy Cognitive Maps for Applied Sciences and Engineering From Fundamentals to Extensions and Learning Algorithms”, Intelligent Systems Reference Library, Volume 54, 2014.</li>
</ol>
<p><br><br></p>
</div>
</div>




</body>
</html>

