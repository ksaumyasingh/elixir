defmodule BlogWeb.PageView do
  use BlogWeb, :view
end
# import Module brings all the Functions and Macros of Module un-namespaced into your module. require Module allows you to use
# macros of Module but does not import them. (Functions of Module are always available namespaced.) use Module first requires
# module and then calls the __using__ macro on Module .
