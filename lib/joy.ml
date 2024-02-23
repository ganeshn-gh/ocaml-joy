let context = Context.context

type 'a point = 'a Shape.point
type shape = Shape.shape
type shapes = Shape.shapes
type transformation = Transform.transformation

type color = Color.color
(** Three-tuple representing a 24-bit RGB color *)

let black = Color.black
let white = Color.white
let red = Color.red
let green = Color.green
let blue = Color.blue
let yellow = Color.yellow
let transparent = Color.transparent
let opaque = Color.opaque
let point = Shape.point
let circle = Shape.circle
let rectangle = Shape.rectangle
let polygon = Shape.polygon
let ellipse = Shape.ellipse
let line = Shape.line
let complex = Shape.complex
let with_stroke = Shape.with_stroke
let with_fill = Shape.with_fill
let no_stroke = Shape.no_stroke
let no_fill = Shape.no_fill
let rotate = Transform.rotate
let scale = Transform.scale
let translate = Transform.translate
let compose = Transform.compose
let repeat = Transform.repeat
let map_fill = Transform.map_fill
let map_stroke = Transform.map_stroke
let set_line_width = Context.set_line_width

let init ?(background = Color.white) ?(line_width = 2) ?(size = (500, 500))
    ?(axes = false) () =
  Context.init_context (Color.opaque background)
    (float_of_int line_width)
    size axes

let write ?(filename = "joy.png") () =
  match !Context.context with
  | Some ctx ->
      if ctx.axes then Render.render_axes ();
      Context.write ctx filename
  | None -> Context.fail ()

let render shape = Render.render shape
let show shapes = Render.show shapes
