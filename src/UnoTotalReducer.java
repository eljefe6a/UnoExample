import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class UnoTotalReducer extends Reducer<Text, IntWritable, Text, IntWritable> {

	@Override
	public void reduce(Text key, Iterable<IntWritable> values, Context context)
			throws IOException, InterruptedException {
		int sum = 0;
		
		// Go through all values to sum up card value for a card color
		for(IntWritable value : values) {
			sum += value.get();
		}
		
		context.write(key, new IntWritable(sum));
	}
}
