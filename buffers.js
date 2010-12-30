(function() {
  var buffers;
  buffers = {
    splatter: 'n = 16\n\ncreateAxis("100%","100%",40)\n\ncube = (x) -> pow(x,3)\npos  =-> 500 + cube (15 * (random()-0.5))\nsize =-> cube 4.5*random()\n\ncircles = set()\nfor i in [1..n]\n  circles.push circle(pos(),pos(),size())\n  .attr\n    fill: color = getColor()\n    opacity: 0.6\n    "stroke": "#333"\n    "stroke-width": 1\n    "stroke-opacity": 0\n\ncircles.mouseover ->\n  this.attr\n    "stroke-opacity": 1\n    opacity:0.85\n    cursor: "pointer"\ncircles.mouseout ->\n  this.anim\n    "stroke-opacity": 0\n    opacity:0.6\n    cursor: "pointer"\n    duration: 140',
    spiral: 'n = 100\n\ncreateAxis("100%","100%",40)\n\nposx = (x) -> 800 + 9*i*sin(pi/12*i)\nposy = (x) -> 500 + 9*i*cos(pi/12*i)\nsize = (x) -> x/2 + 1\n\ncircles = set()\nfor i in [1..n]\n  circles.push circle(posx(i),posy(i),size(i))\n  .attr\n    fill: color = getColor()\n    opacity: 0.6\n    "stroke": "#333"\n    "stroke-width": 1\n    "stroke-opacity": 0',
    chart: 'values = []\ndotsy = []\nclr = []\nc = path("M0,0").attr\n  fill: "none"\n  "stroke-width": 3\n\nfor i in [0..12]\n  values[i] = randomPath(30, i, dotsy)\n  clr[i] = Raphael.getColor()\n  c.attr({path: values[i], stroke: clr[i]})'
  };
  $(document).ready(function() {
    var buffer, flipper;
    $("#show").toggle(function() {
      $('#show').html("Hide Code");
      return $("#code").fadeIn();
    }, function() {
      $('#show').html("Show Code");
      return $("#code").fadeOut();
    });
    $("#cons").toggle(function() {
      return $("#console").fadeIn();
    }, function() {
      return $("#console").fadeOut();
    });
    flipper = function(button, panel, showmsg, hidemsg) {
      return $(button).toggle(function() {
        $(panel).html(hidemsg);
        return $(panel).fadeIn();
      }, function() {
        $(panel).html(showmsg);
        return $(panel).fadeOut();
      });
    };
    flipper("#show", "#code", "Code", "Hide Code");
    flipper("#cons", "#console", "Console", "Hide Console");
    $("#buffers").change(function() {
      var buffer;
      buffer = $(this).val();
      return $("#code").html(buffers[buffer]);
    });
    buffer = $("#buffers").val();
    return $("#code").html(buffers[buffer]);
  });
}).call(this);
