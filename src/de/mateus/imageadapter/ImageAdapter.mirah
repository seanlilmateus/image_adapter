package de.mateus.imageadapter;

import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.GridView;
import android.widget.ImageView;
import android.content.Context;
import android.widget.AbsListView;
import java.util.ArrayList;
import android.view.ViewGroup.LayoutParams;
import android.view.WindowManager;
import 	android.graphics.Point;

class ImageAdapter < BaseAdapter
  def initialize(context:Context)
    @tumbs_ids = ArrayList.new [
      R.drawable.pic_1,
      R.drawable.pic_2,
      R.drawable.pic_3,
      R.drawable.pic_4,
      R.drawable.pic_5,
      R.drawable.pic_6,
      R.drawable.pic_7,
      R.drawable.pic_8,
      R.drawable.pic_9,
      R.drawable.pic_10,
      R.drawable.pic_11,
      R.drawable.pic_12,
      R.drawable.pic_13,
      R.drawable.pic_14,
      R.drawable.pic_15
    ]
      # Keep all Images in array
    @context = context
  end
  
  def thumb_ids:ArrayList
    @tumbs_ids
  end
  
  def getCount
    @tumbs_ids.size()
  end
  
  def getItem(position:int)
    @tumbs_ids.get(position)
  end
  
  def getItemId(position:int):long
    long 0
  end
  
  def getView(position:int, convert_view:View, parent:ViewGroup):View
    image_view = ImageView.new(@context)    
    rsrc = int Integer.parseInt(@tumbs_ids.get(position).toString())
    
    image_view.setImageResource(rsrc)
    image_view.setScaleType(ImageView.ScaleType.CENTER_CROP)
    
    # get screen size
    
    wm = WindowManager @context.getSystemService(Context.WINDOW_SERVICE)
    display = wm.getDefaultDisplay()
    
    size = Point.new
    display.getSize(size)
    width = size.x
    height = size.y
        
    layout_params = AbsListView.LayoutParams.new(ViewGroup.LayoutParams.FILL_PARENT, height / 4)
    
    image_view.setLayoutParams(layout_params)
    image_view
  end
end