package com.youlong.productflavors.project.demo1;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;
import com.youlong.productflavors.project.R;
import com.youlong.productflavors.project.common.Constant;
public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        String str = Constant.API_ADDRESS;
        TextView textView = findViewById(R.id.text_title);
        textView.setText(str);
    }
}
