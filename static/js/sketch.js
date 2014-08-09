(function(){var t,i,e,r,n,a,u;t={width:800,height:800,totalRuns:0,insideCircle:0,textSize:14,gridPadding:40,pointRadius:10,input:null,button:null,radius:320,textArea:{x:10,y:20,w:250,h:90},getOrigin:function(){return{x:this.width/2,y:this.height/2}}},i=function(t,i){return Math.sqrt(t*t+i*i)},e=function(){var i,e,r,n,a,u,o;for(textFont("monospace"),fill(244),i=e=0,n=t.height,a=t.gridPadding;a>0?n>=e:e>=n;i=e+=a)rect(0,i,t.width,1);for(i=r=0,u=t.width,o=t.gridPadding;o>0?u>=r:r>=u;i=r+=o)rect(i,0,1,t.height);return fill(200),rect(0,t.getOrigin().y-1,t.width,2),rect(t.getOrigin().x-1,0,2,t.height),fill(204,101,192,5),stroke(127,63,120),ellipse(t.getOrigin().x,t.getOrigin().y,2*t.radius,2*t.radius),quad(t.getOrigin().x-t.radius,t.getOrigin().y-t.radius,t.getOrigin().x+t.radius,t.getOrigin().y-t.radius,t.getOrigin().x+t.radius,t.getOrigin().y+t.radius,t.getOrigin().x-t.radius,t.getOrigin().y+t.radius)},n=function(){var e,r,n,a,u;return a=Math.random()*t.radius,u=Math.random()*t.radius,noStroke(),i(a,u)-t.radius>0?(fill(226,122,63),e=!1):(fill(69,178,157),e=!0),r=t.getOrigin().x+a,n=t.getOrigin().y-u,ellipse(r,n,t.pointRadius,t.pointRadius),e},a=function(){return t.input=createInput(),t.input.position(20,70),t.button=createButton("Simulate!"),t.button.position(150,70),t.button.mousePressed(function(){return r(),loop()})},u=function(){var i;return fill(255),rect(t.textArea.x-10,t.textArea.y-10,t.textArea.w,t.textArea.h),stroke(0,0,0,0),fill(196,77,88),i=4*t.insideCircle/t.totalRuns,textSize(12),text("Total Experiments (m): "+t.totalRuns,t.textArea.x,t.textArea.y),text("Points inside circle (n): "+t.insideCircle,t.textArea.x,t.textArea.y+20),text("Estimated Pi = 4 x n / m",t.textArea.x,t.textArea.y+40),textSize(18),text("Π = "+i,t.textArea.x,t.textArea.y+70)},r=function(){return t.insideCircle=0,t.totalRuns=0},window.setup=function(){return noLoop(),createCanvas(t.width+1,t.height+1),noStroke(),e(),a()},window.draw=function(){return t.insideCircle+=n()?1:0,t.totalRuns+=1,u(),t.totalRuns+1>parseInt(t.input.value()||10)?noLoop():void 0}}).call(this);