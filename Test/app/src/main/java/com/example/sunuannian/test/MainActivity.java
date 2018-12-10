package com.example.sunuannian.test;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class MainActivity extends Activity {
    TextView t1;
    Button but1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        t1=(TextView)findViewById(R.id.t1);
        but1=(Button)findViewById(R.id.but1);
        but1.setOnClickListener(new L1());
    }
    class L1 implements View.OnClickListener {
        @Override
        public void onClick(View view) {
            t1.setText("hello，这是一个按钮响应事件");
        }
    }
}
