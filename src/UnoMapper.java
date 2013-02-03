import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class UnoMapper extends Mapper<LongWritable, Text, Text, IntWritable> {

	private static Pattern inputPattern = Pattern.compile("(.*) (\\d*)");
	
	@Override
	public void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException {
		String inputLine = value.toString();
		
		Matcher inputMatch = inputPattern.matcher(inputLine);
		
		// Use regex to throw out Wilds, Reverses, Draw Twos
		if (inputMatch.matches()) {
			// Normalize inconsistent case for card colors
			String cardColor = inputMatch.group(1).toLowerCase();
			int cardValue = Integer.parseInt(inputMatch.group(2));
			
			context.write(new Text(cardColor), new IntWritable(cardValue));
		}
	}
}