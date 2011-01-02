buffers =
  splatter: '''
    n = 16

    createAxis("100%","100%",40)

    cube = (x) -> pow(x,3)
    pos  =-> 500 + cube (15 * (random()-0.5))
    size =-> cube 4.5*random()

    circles = set()
    for i in [1..n]
      circles.push circle(pos(),pos(),size())
      .attr
        fill: color = getColor()
        opacity: 0.6
        "stroke": "#333"
        "stroke-width": 1
        "stroke-opacity": 0

    circles.mouseover ->
      this.attr
        "stroke-opacity": 1
        opacity:0.85
        cursor: "pointer"
    circles.mouseout ->
      this.anim
        "stroke-opacity": 0
        opacity:0.6
        cursor: "pointer"
        duration: 140
            '''
  spiral:   '''
    n = 100

    createAxis("100%","100%",40)

    posx = (x) -> 800 + 9*i*sin(pi/12*i)
    posy = (x) -> 500 + 9*i*cos(pi/12*i)
    size = (x) -> x/2 + 1

    circles = set()
    for i in [1..n]
      circles.push circle(posx(i),posy(i),size(i))
      .attr
        fill: color = getColor()
        opacity: 0.6
        "stroke": "#333"
        "stroke-width": 1
        "stroke-opacity": 0
            '''
  chart:    '''
    values = []
    dotsy = []
    clr = []
    c = path("M0,0").attr
      fill: "none"
      "stroke-width": 3

    for i in [0..12]
      values[i] = randomPath(30, i, dotsy)
      clr[i] = Raphael.getColor()
      c.attr({path: values[i], stroke: clr[i]})
            '''
  equation: '''
    eq = (x) -> sin(x)  # equation
    min = 0             # minimum
    max = 4*pi          # maximum
    inc = pi/24         # increment size
    width = 600         # window width
    zoom = 120          # amplitude multiplier
    ox = 400            # x of origin
    oy = 400            # y of origin

    num = (max-min) / inc
    points = []
    point = (x,y) -> circle(x,y,1)
    for i in [0..num]
      x = (inc*i + min)
      y = eq x
      points.push point(x*(width/num/inc) + ox, y*zoom + oy)
            '''

$(document).ready ->
  flipper = (button, panel, showmsg, hidemsg) ->
    $(button).toggle( ->
      $(this).html hidemsg
      $(panel).fadeIn()
    , ->
      $(this).html showmsg
      $(panel).fadeOut()
    )
  flipper("#show",
          "#code",
          "Code",
          "Hide Code")
  flipper("#cons",
          "#console",
          "Console",
          "Hide Console")
  flipper("#tut",
          "#tutorial",
          "Tutorial",
          "Hide Tutorial")
  $("#buffers").change( ->
    buffer = $(this).val()
    $("#code").html buffers[buffer]
  )
  # When buffer selected on reload
  buffer = $("#buffers").val()
  $("#code").html buffers[buffer]
